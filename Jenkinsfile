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
                // Define the Docker image and the Docker tag
                def dockerImage = 'covid-monitor-app'
                def dockerTag = 'latest'
                def dockerRegistry = 'hub.docker.com'
                def dockerCredentialsId = 'dockerhub-cred'
                // Starting the build process
                docker.withRegistry(dockerRegistry,dockerCredentialsId) {
                    def dockerBuild = docker.build("${dockerImage}:${dockerTag}",'.')
                    dockerBuild.push()
                }
            }
        }

    }
}
