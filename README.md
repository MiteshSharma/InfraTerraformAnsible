# Infrastructure Setup and provisioning using Terraform and Ansible

In this project, we are creating 3 instances with webserver, jenkins and prometheus setup on each of them.

## Getting Started

First needs to run terraform with aws access key and secury key. Please provide domain name for route53Module which will setup all needed domains.

Terraform commands:

./terraform init
 
./terraform plan

./terraform apply

./terraform destroy

Then run ansible to provision all servers. Provisioning is done using dynamic inventory and ip addresses are identified using tags. group_vars needs to be provided with right configurations.

Ansible command: ansible-playbook -i ec2.py playbook.yml -vvv
