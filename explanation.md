# Explanation of the Ansible Playbook to Deploy YOLO E-commerce App

# Overview

This document explains the structure and functionality of the Ansible playbook designed to deploy the YOLO e-commerce application. The playbook automates the process of cloning the project repository, setting up a Vagrant environment with ubuntu/focal64, and running Docker containers defined in the docker-compose.yml files.

## Purpose

The playbook simplifies the deployment process by:

1.Installing required dependencies (Vagrant, VirtualBox, Git, Docker, and Docker Compose).

2.Cloning the project repository.

3.Initializing and provisioning a virtual machine using Vagrant.

4.Running the backend and frontend services of the application using Docker Compose.

5.Verifying that the application is accessible in a browser.

## Playbook Workflow

1. Installing Required Packages

The playbook begins by ensuring that essential software packages (git, vagrant, and virtualbox) are installed. These are required to set up the virtual machine and manage the repository.

2. Setting Up the Vagrant Directory

The vagrant_project_dir variable is used to define the directory where the Vagrant environment will reside. The playbook creates this directory if it does not already exist.

3. Cloning the Repository

The repository containing the application (https://github.com/danielsimon254/wk6ip) code is cloned from GitHub into the defined Vagrant directory. This ensures the Vagrantfile and docker-compose.yml files are available for use.

4. Initializing and Starting Vagrant

The 'vagrant up' command initializes and provisions the virtual machine defined in the Vagrantfile. This sets up an Ubuntu environment (ubuntu/focal64) with port forwarding configured for the backend (port 8000) and frontend (port 3000). Ensure there is no port conflicting or edit the ports on vagrant file.

5. Running Docker Compose

Once the Vagrant environment is up, Docker Compose is executed within the project directory to pull the required Docker images (brianbwire/brian-yolo-backend:v1.0.0 and brianbwire/brian-yolo-client:v1.0.0) and start the containers.

6. Verifying Accessibility

Finally, the playbook performs an HTTP request to http://localhost:3000 to ensure the frontend service is running and accessible in the browser.

# Key Variables

vagrant_project_dir: Defines the path to the directory where the Vagrant environment is set up.

git_repo: The URL of the GitHub repository to be cloned (https://github.com/danielsimon254/wk6ip).

# Prerequisites

All Mentioned on README.md file on https://github.com/danielsimon254/wk6ip.

# NOTE

The target system (localhost) should have access to the internet.


## Expected Result

After running the playbook, the YOLO e-commerce application will be:

Deployed on a Vagrant-managed Ubuntu virtual machine.

Running with backend and frontend services accessible via http://localhost:8000 (backend) and http://localhost:3000 (frontend).

## Usage Instructions

Clone this playbook to your local machine.

Run the playbook using the following command:

ansible-playbook playbook.yml

Access the application in your browser at http://localhost:3000.

## Troubleshooting

If Vagrant fails to start, ensure VirtualBox is properly installed and operational.

If Docker Compose fails, verify that the docker-compose.yml file is correctly formatted and references the appropriate images.
