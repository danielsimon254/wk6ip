# STAGE 1

# Overview
 This project involved the automation of configuration using ansible. Ansible is set to deploy microservices to virtualbox using Vagrant. 
Everything is automated and by playing the ansible book, the application gets fired up automatically!!!


# Requirements
1. Ansible Must be installed on the host.
2. Vagrant also must be installed.
3. Virtual box must be installed.
4. Docker and docker compose must be installed to run the containers.

## How to launch the application 
The Images will be pulled from the following docker hub account: brianbwire/brian-yolo-client:v1.0.0 (Image shown below).

![Alt text](image.png)

## How to run the app
Use vagrant up --provision command

![Alt text](vag.png)

## User Requirements

Ensure you can ssh to the provisioned VMs


# Stage 2

Stage 2 of the project uses ansible and terraform for implementation of the project.

## Running the Process using terraform
Provision with Terraform: 
1. First, run 'terraform apply' to provision the VM on VirtualBox. Terraform will set up the virtual machine and run the initialization script (init.sh), which installs Docker.

2. Configure with Ansible: After the VM is provisioned and Docker is installed, run the Ansible playbook to pull the Docker image, create a container, and configure it for the application.

## Best Practices Applied on this project
Terraform in the shared repository on branch revert-25-master uses remote-exec to run the initialization script on the VM.

## NOTE
Ensure that SSH access is correctly set up for successful deployment.