pipeline {
   agent any
   environment 
    {
        VERSION = "${BUILD_NUMBER}"
        PROJECT = 'spring3_app'
        IMAGE = "$PROJECT:$VERSION"
        ECRURL = 'https://890742609766.dkr.ecr.ap-south-1.amazonaws.com/spring3_app'
        ECRCRED = 'ecr:ap-south-1:aws_credentials'
    }   
    stages {
      stage('GetSCM') {

         steps {

            // Get some code from a GitHub repository
            git url: 'https://github.com/jmstechhome18/spring3-mvc-maven-xml-hello-world.git'
         }
         }
      stage('build'){
             
             steps{
                 sh 'mvn package'
             }
         }
      stage('Image Build'){
             steps{
                 script{
                   // sh "docker build -t $IMAGE ."
                   docker.build(IMAGE)
                }
             }
         }
    stage('Push Image'){
         steps{
             script
                {
                    docker.withRegistry(ECRURL, ECRCRED)
                    {
                        docker.image(IMAGE).push()
                    }
                }
            }
         }
      stage('running_app'){
             steps{
                 script{
                       sh "docker rmi -f spring3_app:$VERSION"
                       
                 }
             }
         }
         
    }
    
}
