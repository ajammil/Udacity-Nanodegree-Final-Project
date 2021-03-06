@Library('github.com/releaseworks/jenkinslib') _
pipeline { environment {
    registry = "ajammil/udacity_capstone_project"
    registryCredential = 'dockerhub_credentials'
    // MY_PASSWORD = 'dockerhub_password'
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
                    withCredentials([string(credentialsId: 'dockerhub_password', variable: 'MY_PASSWORD')]) {
                            sh "echo '${MY_PASSWORD}' | docker login --username ajammil --password-stdin"
                        }
                    // sh "echo ""$MY_PASSWORD"" | docker login --username ajammil --password-stdin"

                    // sh script: 'docker login --username ajammil --password-stdin', stdin: "$MY_PASSWORD"
                    sh "docker push $registry:$BUILD_NUMBER"
                    // docker.withRegistry( '', registryCredential ) {
                    // dockerImage.push()
                    
                    // }

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
                 withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    // AWS("eks --region eu-central-1 update-kubeconfig --name udacity-capstone")
                    sh "sudo aws eks --region eu-central-1 update-kubeconfig --name udacity-capstone"
            }
                sh "kubectl set image deployment/capstone-deployment capstone=$registry:$BUILD_NUMBER"
            }
        
        }
    }
}