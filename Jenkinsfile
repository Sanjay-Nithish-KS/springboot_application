pipeline {
    agent any 
    stages {
        stage('BUILD') {
            steps {
                sh 'git tag build-$BUILD_NUMBER'
                sh 'git push --tags git@github.com:Sanjay-Nithish-KS/springboot_application.git'
                sh 'docker build -t sanjaynithish/spring_boot_application:build-$BUILD_NUMBER .'
            }
        }
        stage('DOCKER LOGIN') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker Hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh 'docker login --username $username --password $password'
                }
            }
        }
        stage('PUSH DOCKER IMAGE') {
            steps {
                sh 'docker push sanjaynithish/spring_boot_application:build-$BUILD_NUMBER'
            }
        }
    }
    post {
        success {
            emailext body: 'The BUILD-$BUILD_NUMBER has been built sucessfully', subject: 'BUILD-$BUILD_NUMBER', to: 'sanjaypresidio@gmail.com'
            step {
                def build=$BUILD_NUMBER
            }
            build job: 'assignment-10-pipeline', parameters: [string(name: 'Build_No', value: '$build')]
        }
    }
}
