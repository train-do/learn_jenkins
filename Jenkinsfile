pipeline {
    agent any

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
    }
}
