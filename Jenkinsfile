pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GIT repository
                checkout scm
            }
        }

        stage('Build and Push') {
            steps {
                script {
                    // Define the Docker image and the Docker tag
                    def dockerImage = 'aryansr/covid-monitor-app'
                    def dockerTag = 'latest'
                    //def dockerRegistry = 'https://docker.io'
                    def dockerCredentialsId = 'dockerhub-cred'
                    // Starting the build process
                    def dockerBuild = docker.build("${dockerImage}:${dockerTag}",'.')
                    dockerBuild.push()
                
                }
            }
        }

    }
}
