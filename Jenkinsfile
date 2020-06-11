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
                 docker.build registry + ":$BUILD_NUMBER"
             }
         }
         stage('Pushing Docker Image to Docker Hub') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }
        }
        
     }
}