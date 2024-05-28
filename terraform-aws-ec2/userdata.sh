#! /bin/bash
# Update the system packages
sudo apt update && apt upgrade -y

# Install the necessary packages
sudo apt install software-properties-common unzip -y

# Add Ansible PPA and install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Install the AWS CLI version 2
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install

# Configure SSH key using the AWS Secrets Manager
mkdir -p /root/.ssh

# Download and copy elie.pem from S3 to /root/.ssh/id_rsa
sudo aws s3 cp s3://dg-cohort-01/elie-key/elie.pem /root/.ssh/id_rsa

chmod 600 /root/.ssh/id_rsa

# Clone Git repository to /opt/dg-ansible-playbooks
GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' git clone git@github.com:deployguru-learning/elie-bamunoba-dg-ansible.git /opt/dg-ansible-playbooks

chown -R ubuntu:ubuntu /opt/dg-ansible-playbooks
chown -R ubuntu:ubuntu /root/.ssh
