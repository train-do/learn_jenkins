pipeline {
    agent any

    environment {
        IMAGE_NAME = 'learnjenkins-csharp'         // Nama Docker image
        IMAGE_TAG = "${env.BUILD_NUMBER}"          // Bisa juga "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/train-do/learn_jenkins.git'
            }
        }

        stage('Restore') {
            steps {
                sh 'dotnet restore'
            }
        }

        stage('Build') {
            steps {
                sh 'dotnet build --configuration Release'
            }
        }

        stage('Test') {
            steps {
                sh 'dotnet test --no-build --verbosity normal'
            }
        }

        stage('Publish') {
            steps {
                sh 'dotnet publish -c Release -o out'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        // Optional: Push DockerHub
        // stage('Push to DockerHub') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
        //             sh '''
        //                 echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
        //                 docker tag ${IMAGE_NAME}:${IMAGE_TAG} yourdockerhub/${IMAGE_NAME}:${IMAGE_TAG}
        //                 docker push yourdockerhub/${IMAGE_NAME}:${IMAGE_TAG}
        //             '''
        //         }
        //     }
        // }

        // Optional: Deploy via SSH ke server
        // stage('Deploy') {
        //     steps {
        //         sshagent(['ssh-credential-id']) {
        //             sh 'ssh user@yourserver "docker run -d -p 5000:80 yourdockerhub/${IMAGE_NAME}:${IMAGE_TAG}"'
        //         }
        //     }
        // }
    }
}
