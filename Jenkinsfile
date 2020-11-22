#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@master', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://gitlab.com/nanuchi/jenkins-shared-library.git',
     credentialsId: 'gitlab-credentials'
    ]
)

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        IMAGE_NAME = 'nanajanashia/demo-app:java-maven-1.0'
    }
    stages {
        stage('build app') {
            steps {
               script {
                  echo 'building application jar...'
                  
               }
            }
        }
        stage('build image') {
            steps {
                script {
                   echo 'building docker image...'
                   
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                   def executeScript = "bash ./test.sh" 
                   sshagent(['ec2-server-key']) {
                       sh "scp test.sh ec2-user@35.180.251.121:/home/ec2-user"
                       sh "ssh -o StrictHostKeyChecking=no ec2-user@35.180.251.121 ${executeScript}"
                   }
                }
            }
        }
    }
}
