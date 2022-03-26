pipeline{
    agent any
    environment {
        PROJECT_NAME = "Devops"
    }
    parameters {
    string defaultValue: 'main', name: 'Branch'
    choice choices: ['dev', 'qa', 'sandbox', 'prod'], name: 'Environment'
    }
    
    
    
    options {
        timestamps()
    }
    stages {
        stage('pull code') {
            steps {
              git branch: 'main', credentialsId: 'gihubcredentialss', url: 'https://github.com/sudharshanrr/Angular13.git'
            }
        }
        stage('Build image') {
          steps {
             sh "docker build -t ddd ."
          }
        }
//         stage('Push to docker hub') {
//             steps {
//               withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhub-password')]) {
//                 sh "docker login -u sudharshanrr -p ${dockerhub-password}"
//               }
//               sh "docker push sudharshanrr/aa"
//             }
//         }
    }

}
