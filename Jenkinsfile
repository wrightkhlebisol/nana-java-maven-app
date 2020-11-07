@Library('jenkins-shared-library')_

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('test') {
            steps {
                script {
                    buildJar()
                }
            }
        }
        stage('build') {
            steps {
                script {   
                    buildDockerImage 'nanajanashia/demo-app:jma-3.0'
                }
            }
        }
        stage('deploy') {
            when {
                expression {
                   BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                    echo "Deploying the application..."
                }
            }
        }
    }
}
