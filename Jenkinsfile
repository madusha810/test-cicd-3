pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_IMAGE = 'madusha810/test-cicd-3'
        CONTAINER_NAME = 'my-first-container'
    }

    stages {
        stage('Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/madusha810/test-cicd-3.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", 'dockerhub-credentials-id') {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Ensure no existing container with the same name is running
                    sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run --name ${CONTAINER_NAME} -d -p 8080:80 ${DOCKER_IMAGE}
                    """
                }
            }
        }

    }
    // post {
    //     always {
    //         // Cleanup after build
    //         script {
    //             sh "docker rm -f ${CONTAINER_NAME} || true"
    //         }
    //     }
    // }
}
