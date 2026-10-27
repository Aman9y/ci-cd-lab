pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm install'
                    } else {
                        bat 'npm install'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm test'
                    } else {
                        bat 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            when {
                expression {
                    return env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'origin/main' || env.GIT_BRANCH == 'main'
                }
            }
            steps {
                script {
                    if (isUnix()) {
                        sh 'chmod +x deploy.sh && ./deploy.sh'
                    } else {
                        bat 'call deploy.bat'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully - app deployed at http://localhost:8081'
        }
        failure {
            echo 'Pipeline failed - deployment skipped. Check test results above.'
        }
    }
}
