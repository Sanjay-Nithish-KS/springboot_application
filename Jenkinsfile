pipeline {
    agent any 
    stages {
        stage('build') {
            steps {
                sh 'git tag build-$BUILD_NUMBER'
                sh 'git push --tags git@github.com:Sanjay-Nithish-KS/springboot_application.git'
                sh 'docker build -t sanjaynithish/spring_boot_application:build-$BUILD_NUMBER .'
            }
        }
        stage('push docker image') {
            steps {
                sh 'docker login --username sanjaynithish --password scf@94430'
                sh 'docker push sanjaynithish/spring_boot_application:build-$BUILD_NUMBER'
            }
        }    
    }
}
