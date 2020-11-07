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
                    echo "Testing the application..."
                    // echo "Executing pipeline for branch $BRANCH_NAME"
                    buildJar()
                }
            }
        }
        stage('build') {
            when {
                expression {
                   BRANCH_NAME == 'master' 
                }
            }
            steps {
                script {   
                    echo "Building the application..."    
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
