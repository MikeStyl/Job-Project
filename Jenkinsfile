pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Clone the repository
                    checkout scm

                    // Build the Python app (install Flask)
                    sh 'pip install Flask'

                    // Dockerize the app
                    sh 'docker build -t my-python-app .'
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub (replace with your Docker Hub credentials)
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }

                    // Tag and push the Docker image to Docker Hub
                    sh 'docker tag my-python-app your-dockerhub-username/my-python-app:latest'
                    sh 'docker push michalisst/my-python-app:latest'
                }
            }
        }
    }
}
