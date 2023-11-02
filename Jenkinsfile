pipeline {
    agent docker-agent
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
}
