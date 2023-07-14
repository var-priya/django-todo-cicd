pipeline{
    agent{label 'dev'}
    stages{
           stage("code clone...")
           {
               steps{
                   git url:"https://github.com/var-priya/django-todo-cicd.git", branch:"develop"
               }
           }
             stage("code build and test...")
           {
               steps{
                   sh 'docker build . -t django-todo-app'
               }
           }
             stage("Login Dockerhub and push image...")
           {
               steps{
                   echo "logging into docker hub and pushing image..."
                   withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPassword')])
                   {
                       sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   }
               }
           }
             stage("code deployed...")
           {
               steps{
                   sh 'docker-compose down && docker-compose up -d'
               }
           }
          }
}
