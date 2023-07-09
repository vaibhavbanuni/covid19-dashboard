pipeline {
    agent any

    stages {
        stage('Go to Git') {
            steps {
                // This stage is to checkout the Git Repo
                checkout scm
            }
        }
        stage('Build and Push') {
            steps {
                script {
                    // Defining Docker Image and Tag variables
                    def dockerImage = "vaibhavbanuni/jenkins-node-app"
                    def dockerTag = "latest"
                    def dockerCredentialsId = "Dockerhub"
                    // Starting the Build Process
                    def dockerBuild = docker.build("${dockerImage}:${dockerTag}",'.')
                    docker.withRegistry('', dockerCredentialsId) {
                        dockerBuild.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'k8s', serverUrl: '192.168.18.137:6443']) {
                        sh 'kubectl create -f deployment.yml'
                    }   
            }
        }
    }
}
}
