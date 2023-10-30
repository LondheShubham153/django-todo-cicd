pipeline {
    agent any 
    stages{
        stage("Code Clone"){
            steps {
                git url: "https://github.com/swastik7777/django-todo-cicd.git",branch: "master"
            }
        }
        stage("Code Build"){
            steps {
                sh "docker build . -t django-app"
            }
        }
        stage("Push code To DockerHub"){
            steps {
                withCredentials([usernamePassword(credentialsId: "dockerHub",passwordVariable: "dockerHubpass",usernameVariable: "dockerHubuser")]){
                    sh "docker login -u ${env.dockerHubuser} -p ${env.dockerHubpass}"
                    sh "docker tag django-app ${env.dockerHubuser}/django-app:latest"
                    sh "docker push ${env.dockerHubuser}/django-app:latest"
                }
                
            }
        }
        stage("Code Deploy"){
            steps {
                sh "docker-compose down && docker-compose up -d --no-deps --build web"
            }
        }
    }
    
}
