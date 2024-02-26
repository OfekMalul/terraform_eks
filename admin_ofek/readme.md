# Terraform EKS Cluster Project Dev-1

## Architecte Overview
![alt text](diagram.png)
## Description
This terraform project implement an EKS cluster using terraform. Creating VPC with public subnets across multiple AZ's, an EKS as well as policy and role for ALB ingress controller.  

## Pre Requirements
* Terraform installed
* AWS account
## Installation

To install terraform on your machine please follow the link:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

To install aws CLI on your machine:
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

To enable your local machine to communicate with your aws account you can:
1. Create a specific user group and user to manage the eks cluster
2. Utilize your admin account
3. .....

```bash
aws configure
```

## Setup the EKS Cluster
In order to setup the cluster please follow along
1. Create VPC
```bash
terraform apply --auto-approve
```

2. Copy vpc_id to variables in the eks cluster (the vpc_id should appear on your terminal)

3. Create the EKS cluster
```bash
terraform apply --auto-approve
```

4. Create the IAM policy
```bash
terraform apply --auto-approve
```
5. Copy the policy arn (should appear on the console) into the roles variables file

6. Create the role
```bash
terraform apply --auto-approve
```

## Summary
At this point you have an EKS cluster available with all required permissions.
Loadbalancer has yet to be created for the EKS cluster. You will need to deploy your configure helm chart to make it work. You can observe the helm chart in my repository for reference 
https://github.com/OfekMalul/helm_charts