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
                    def dockerImage = "vaibhavbanuni/jenkins-covid-app"
                    def dockerTag = "latest"
                    def dockerCredentialsId = ""
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
                    withKubeConfig([credentialsId: 'akskubeconfig', serverUrl: 'https://networknuts-dns-kg6hiwja.hcp.centralindia.azmk8s.io']) {
                        sh 'kubectl apply -f deployment.yml'
                }
            }
        }
    }
}
}
