pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    environment {
        DOCKER_IMAGE = 'muntasirulhaque/comp367-webapp'
        DOCKER_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Clean Maven Repository') {
            steps {
                // Delete corrupted plugin folder (ignore errors if it doesn't exist)
                bat 'rmdir /s /q C:\\WINDOWS\\system32\\config\\systemprofile\\.m2\\repository\\org\\apache\\maven\\plugins\\maven-clean-plugin || exit 0'
            }
        }
        
        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }
        
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                bat "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Docker Push') {
            steps {
                bat "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                bat "docker push ${DOCKER_IMAGE}:latest"
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline executed successfully! Docker image pushed to Docker Hub!'
        }
    }
}
