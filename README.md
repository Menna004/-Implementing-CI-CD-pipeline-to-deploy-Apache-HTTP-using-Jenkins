# Mennatallah-Abdelhamid
-Install and Configure Apache HTTP Server

This Ansible playbook automates the installation and configuration of Apache HTTP Server on target hosts. 

Before running the Ansible playbook, ensure that you have installed Ansible ,you can access to target hosts using ssh 

To run the Ansible playbook, follow these steps:
1.make directory to contain the playbook
mkir project

2.Navigate to the directory 
cd project

3.Clone this repository to your local machine
git clone https://github.com/manoosh44/Mennatallah-Abdelhamid/blob/main/WebServerSetup.yml

4. create the inventory file (inventory_file) to specify the target hosts and their connection details the same directory
   [vm3]
   192.168.1.9
   
5.Ping the remote host to check the connectivity
ansible -i inventory_file vm3 -m ping

6.Run the playbook using the ansible-playbook command
ansible-playbook -i inventory_file  WebServerSetup.yml

--------------------------------------------------------------------------------------------------------------------------------------
-Jenkins pipeline configuration

This Jenkins pipeline automates the process of checking out a Git repository, executing an Ansible playbook, and sending an email notification in case of pipeline failure.

Notes
.Ensure that Ansible is installed and configured correctly on the Jenkins server
.Make sure the necessary credentials (for Git and Ansible) are configured in Jenkins.
.Create a new pipeline project in Jenkins.
.Copy the provided pipeline script into the pipeline configuration.
.Adjust the Git repository URL, playbook path, and email recipient address as needed.

Pipeline Structure
The pipeline consists of the following stages:

1. Checkout
   
This stage checks out the code from a Git repository from the specified Git repository (http://192.168.1.8/root/final) 

2. Execute Playbook
   
This stage executes an Ansible playbook for setting up a web server(project/WebServerSetup.yml).

Parameters:
become: true: Run the playbook with privileges.
credentialsId: 'keyy': Use the specified Jenkins credentials for authentication.
disableHostKeyChecking: true: Disable SSH host key checking.
installation: 'ansible': Use the 'ansible' installation defined in Jenkins.
inventory: 'project/inventory_file': Specify the inventory file for target hosts.
playbook: 'project/WebServerSetup.yml': Specify the path to the Ansible playbook.
vaultTmpPath: '': Specify the path to the Ansible vault temporary directory.

4. Email Jenkins Pipeline
   
 This stage sends an email notification in case of pipeline failure.Use a scripted pipeline (script block) to customize the email content.
Get the failure reason from the Jenkins log using currentBuild.rawBuild.getLog(1000).join('\n').
Get the current date and time using new Date().format('yyyy-MM-dd HH:mm:ss').
Use the emailext step to send an email notification.

Parameters:
subject: Subject line for the email.
body: Body of the email containing the failure reason and execution date.
to: Email address to which the notification should be sent (menna.abdelhamid73@gmail.com).





