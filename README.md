## Pre-requisites 

### Creating workstation 
Make sure that you are having a workstation with below packages
- git
- terraform
- python3
- pip3
- awscli
- kubectl

### Update the variable ec2_ssh_key with your public key for your server access
ec2_ssh_key - ssh key in file variables.tf

## Building Microserivce Platform - EKS:
→ make sure you are configuring aws cli before you start

```sh 
→ git clone https://github.com/shan5a6/eks-infra-terraform.git
→ cd eks-infra-terraform
→ terraform init
→ terraform apply -auto-approve
```
Note: It take around 5-10 minutes to build the eks cluster
```sh
→ aws eks update-kubeconfig --name clustername --region us-east-1 # update the kubeconfig 
```
##### EKS Architecture
![EKS Architecture](EKS.jpg)
