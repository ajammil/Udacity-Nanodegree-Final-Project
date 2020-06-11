pipeline { environment {
    registry = "ajammil/udacity_capstone_project"
    registryCredential = 'dockerhub_credentials'
  }
     agent any
     stages {
		 stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Building Docker Image') {
             steps {
                 script {
                    docker.build registry + ":$BUILD_NUMBER"
                 }
             }
         }
         stage('Pushing Docker Image to Docker Hub') {
            steps{
                script {
                    sh "docker push $registry:$BUILD_NUMBER"
                }
            }
        
        }
        stage('Cleanup') {
            steps{
                script {
                    sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }
        
        }
        stage('Update hosted image'){
            steps{
                sh "kubectl set image deployment/capstone-deployment capstone=$registry:$BUILD_NUMBER"
            }
        
        }
    }
}