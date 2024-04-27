pipeline
{
    agent any
    stages
    {
        stage("checkout"){
            steps{
                git branch: 'main', url: 'http://192.168.1.8/root/final'
            }            
        }
        stage("execute playbook"){
            steps{
                  ansiblePlaybook become: true, credentialsId: 'keyy', disableHostKeyChecking: true, installation: 'ansible', inventory: 'project/inventory_file', playbook: 'project/WebServerSetup.yml',     vaultTmpPath: ''
            } }
        stage("Email jenkins pipeline"){
            steps{
             script{
                 
                def failureReason = currentBuild.rawBuild.getLog(1000).join('\n') // Get failure reason from Jenkins log
                def executionDate = new Date().format('yyyy-MM-dd HH:mm:ss') // Get current date and time
                emailext subject: 'Pipeline Failure Notification',
                         body: "Pipeline failed with reason: ${failureReason}\n\n" + 
                               
                               "Date of pipeline execution: ${executionDate}",to: 'menna.abdelhamid73@gmail.com'
             }
            }
            
        }
            
    }
}
         
