pipeline {
    agent {label 'docker'}
    tools
    {
      maven "mymaven"
     }
 
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
               sh "docker build -t javawebapp ."
                sh  "docker tag javawebapp:latest mamathasama/javawebapp:latest"
                  }
                 }
stage ('push docker image to docker hub') {
       steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubUserPasswd', usernameVariable: 'dockerHubUser')]) {
    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubUserPasswd}"
    sh "docker push mamathasama/javawebapp:latest" 
} 
}

        
              }

}

