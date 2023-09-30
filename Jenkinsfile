pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('michalisst/my-python-app:latest')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        // Push the Docker image to Docker Hub
                        docker.image('michalisst/my-python-app:latest').push()
                    }
                }
            }
        }
    }
}
