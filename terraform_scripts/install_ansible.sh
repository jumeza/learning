#!/bin/bash
# Installing Ansible on EC2 instance

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
	  sleep 1
  done
# Install Ansibble
sudo apt update -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y
