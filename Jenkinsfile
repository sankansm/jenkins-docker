pipeline{
    agent any
    
    stages{
        stage('Build'){
            steps{
                git url: 'https://github.com/sankansm/jenkins-docker.git', branch: 'master'
                sh 'mvn clean install'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/**/*.war'
                }
            }
        }
        stage('Bake Image'){
                steps{
                sh "packer build  -var 'component=${JOB_NAME}-${BUILD_NUMBER}' packer.json"

                }
            }
        stage('Deploy'){
                steps{
                    input message: "Approve the Deploy?"
                    sh 'terraform init'

                    sh 'terraform apply -var component=${JOB_NAME}-${BUILD_NUMBER} -auto-approve'
                }
            }    
            
    }
}
