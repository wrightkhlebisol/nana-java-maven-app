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
        IMAGE_NAME = 'nanajanashia/demo-app:java-maven-1.1'
    }
    stages {
        stage('build app') {
            steps {
               script {
                  echo 'building application jar...'
                  buildJar()
               }
            }
        }
        stage('build image') {
            steps {
                script {
                   echo 'building docker image...'
                   buildImage(env.IMAGE_NAME)
                   dockerLogin()
                   dockerPush(env.IMAGE_NAME)
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                   echo 'deploying docker image to EC2...'
                   def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
                   sshagent(['ec2-server-key']) {
                       sh "scp server-cmds.sh ec2-user@35.180.251.121:/home/ec2-user"
                       sh "scp docker-compose.yaml ec2-user@35.180.251.121:/home/ec2-user"
                       sh "ssh -o StrictHostKeyChecking=no ec2-user@35.180.251.121 ${shellCmd}"
                   }
                }
            }
        }
    }
}
