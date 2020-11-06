def gv

pipeline {
    agent any
    tools {
        maven: 'my-mvn'
    }
    stages {
        stage("init") {
            steps {
                script {
                   gv = load "script.groovy" 
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    gv.buildApp();
                    mvn package
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh("docker build -t nanajanashia/demo-app:jma-2.0 .")
                        sh("echo $PASS | docker login -u $USER --password-stdin")
                        sh("docker push nanajanashia/demo-app:jma-2.0")
                    }
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }   
}