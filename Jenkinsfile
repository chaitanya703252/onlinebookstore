
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'onlinebookstore:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build App') {
            steps {
                // Run if you have a "build" script (e.g., React/Angular/Vite)
                sh 'npm run build || echo "No build script, skipping..."'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f onlinebookstore || true
                docker run -d --name onlinebookstore -p 8286:3000 ${DOCKER_IMAGE}
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
