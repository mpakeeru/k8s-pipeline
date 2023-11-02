pipeline {
    agent {label 'docker'}
    tools
    {
      maven "mymaven"
     }
 stages { 
 	stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/mpakeeru/SimpleTomcatWebapp.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean install package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }        
            }  

  	stage ('Build a Docker Image') {
           steps {
            git 'https://github.com/mpakeeru/k8s-pipeline.git'
               sh "docker build -t javawebapp ."
                sh  "docker tag javawebapp:latest mamathasama/javawebapp:latest"
                  }
                 }
	stage ('push docker image to docker hub') {
       		steps {
        	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubUserPasswd', usernameVariable: 'dockerHubUser')]) {
    		sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubUserPasswd} docker.io" 
    		sh "docker push mamathasama/javawebapp:latest" 
		}		 
		}
         }
        stage ('Deploy to k8s') {

      		steps {
		  sh "kubectl apply -f javawebapp-deployment.yml javawebapp-service.yml"		

		}
		}		

        
}
}

