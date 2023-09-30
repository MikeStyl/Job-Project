pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Use a Docker image with Python and pip installed
                agent {
                    docker {
                        image 'python:3.9'
                        reuseNode true
                    }
                }
                
                // Set the working directory inside the container
                dir('/app') {
                    // Copy the Python app into the container
                    sh 'cp -r * /app'
                    
                    // Install Flask (or any other dependencies your app requires)
                    sh 'pip install Flask'
                    
                    // Build the Docker image
                    sh 'docker build -t helloworld-app .'
                }
            }
        }

        stage('Publish Docker Image') {
            steps {
                // Log in to Docker Hub (replace with your Docker Hub credentials)
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                }
                
                // Push the Docker image to Docker Hub
                sh 'michalisst/helloworld-app:latest'
            }
        }
    }
}
