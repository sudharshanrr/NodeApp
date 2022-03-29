pipeline{
    agent any
    environment {
        PROJECT_NAME = "Devops"
    }
    parameters {
    string defaultValue: 'main', name: 'Tagid'
    choice choices: ['dev', 'qa', 'sandbox', 'prod'], name: 'Environment'
    }
    
    
    
    options {
        timestamps()
    }
    stages {
        stage('pull code') {
            steps {
              git branch: 'main', credentialsId: 'gihubcredentialss', url: 'https://github.com/sudharshanrr/NodeApp.git'
            }
        }
        stage('Build image') {
          steps {
              sh "docker build -t sudharshanrr/ddd:$Tagid ."
          }
        }
        stage('Push to docker hub') {
            steps {
//               withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhub-password')]) {
                sh "docker login -u sudharshanrr -p Sudha@2662"
//               }
              sh "docker push sudharshanrr/ddd:$Tagid"
              sh "docker rmi -f sudharshanrr/ddd:$Tagid"
              
             sshagent(['devops-remoe']) {
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@65.0.55.21 uptime'
                sh 'ssh -v ec2-user@65.0.55.21 touch aa.text && touch bb.text'
             }
            }
        }
    }

}
