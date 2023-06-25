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
                                                              
                       sh "docker run -d --name covidapp -p 8000:8000 vaibhavbanuni/jenkins-covid-app:latest" 
                }
            }
        }
    }
}
}
