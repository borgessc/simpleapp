# Deploy Simpleapp Hello Word

This Terraform will deploy an application within AWS ECS container service using
the Following tools:

AWS ECS (Define the cluster that handle all resources and services to comunicate with Instances EC2 )
AWS ECR (define the repository that deploy Container images for micro services)
AWS EC2 (Auto-scaliing group, security groups, instances )
AWS ALB (Application Load Balance that define a way to connection with any resources)


## Folder structure

The deployment is separeted with Folder for each purpose

**`APP` folder**
Has all code related to main Application and the Dockerfile used to deploy within ECS

**`ecr-repository` Folder**
Contain terraform recipe to deploy the configuration for Elastic Container Registry
It defines the main repository to deploy container images.

**`main-terraform` folder**
Contain the main terraform recipe to deploy the whole infrastructure.

**`terraform-state` folder**
Contain the definition of how to store and maintain the terraform State and lockID when running any terraform file, avoiding teams to deploy resources at same time within same environment.

**`vpc` folder**
The folder contain the configuration to deploy, maintain the configuration for Main VPC network.

Having the VPC configuration separeted we can make changes easily avoiding issue with other terraform file for different purposes.

Also it's easy to use to deploy new version of this VPC in other regions or even different types of environment like (Production/Stage/Development)




# AWS Profile 

To execute terraform within the environment, AWS credentials need to be set prior to start the deployment.

Visit: AWS IAM on AWS Web-UI and generate credentials for your access.
For more infomation please visit: https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

Once you have the `Access_key` and `Secret_Key`

Create a profile into AWS credentials file like below

edit ~/.aws/credentials 

```
[user-root-test]
output=json
aws_access_key_id = A......6I
aws_secret_access_key = U.........lz
region = ap-southeast-2
aws_session_token =
```
## Installing Terraform

Terraform will be the main tool used to deploy this solution, to install and execute follow the steps below.
This recipe was written in terraform version 12, so download the latest version here
* Find your system version here https://releases.hashicorp.com/terraform/0.12.29/
* Download the binary https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
* Extract the binary directly to your path

 e.g #`unzip terraform_0.12.29_linux_amd64.zip /usr/local/bin` 

## Deploy order for the infrastructure

# **Start from Terrafor state folder**

## Terraform state
It's a simple terraform configuration that define Dynamodb and create tables that will store the state of each terraform infrastructure and also the lockID.

_Check `variables.tf` and define the name of resource, this will unique name._

Simply 
**Inicialize terraform**
```
AWS_PROFILE=user-root-test terraform init
```

**Plan/Apply the terraform state deployment**

```
AWS_PROFILE=user-root-test terraform plan -var-file=ap-southeast-2.tfvars

AWS_PROFILE=user-root-test terraform apply -var-file=ap-southeast-2.tfvars
```

## VPC
TO deploy the VPC will to create all networks that will be used for this environment

_Check `variables.tf` and define the VPC CIDR, Region, VPC Name and which account will be allowed to deploy these resources._

Go to:

`cd vpc/build-vpc`

**Inicialize terraform**
```
AWS_PROFILE=user-root-test terraform init
```

**Plan/Apply the VPC deployment**

```
AWS_PROFILE=user-root-test terraform plan -var-file=ap-southeast-2.tfvars

AWS_PROFILE=user-root-test terraform apply -var-file=ap-southeast-2.tfvars
```

After apply the configuration, collect the Terraform outputs that will be used to define the other resources onwards.

E.g
```
Outputs:

az_1_nat_gateway_id = nat-0f248274af52676a5
az_1_private_subnet_id = subnet-0c33b701c4e14e92a
az_1_private_subnet_route_table_id = rtb-0c95a5dd2147edb0e
az_1_public_subnet_id = subnet-0e2a0350b48de2c77
az_2_nat_gateway_id = nat-0249204d06e0c8d04
az_2_private_subnet_id = subnet-0bcdf8417219b7525
az_2_private_subnet_route_table_id = rtb-0ab91b60e6c50f950
az_2_public_subnet_id = subnet-0e57a37312ff05cf5
az_3_nat_gateway_id = nat-043e1f2ad070ed907
az_3_private_subnet_id = subnet-0bc5527a29f44842a
az_3_private_subnet_route_table_id = rtb-0010795d9992c6a91
az_3_public_subnet_id = subnet-0f8cec80959cd691f
internet_gateway_id = igw-06705a93bdf3f8302
vpc_cidr_block = 10.15.0.0/16
vpc_default_network_acl_id = acl-011d1a26fc0fa1c78
vpc_default_route_table_id = rtb-07157c11bde25aa38
vpc_default_security_group_id = sg-099855ba20b369f33
vpc_id = vpc-0fb91579977406404

```

## ECR repository

That folde define the Repository that will store container images.

_Just define the `repository_name` in `variables.tf` this should be an unique name._

**Inicialize terraform**
```
AWS_PROFILE=user-root-test terraform init
```

**Plan/Apply the ERC repository deployment**

```
AWS_PROFILE=user-root-test terraform plan -var-file=ap-southeast-2.tfvars

AWS_PROFILE=user-root-test terraform apply -var-file=ap-southeast-2.tfvars
```

Output need to be collected as well, you will receive something like this:

e.g `141729888478.dkr.ecr.ap-southeast-2.amazonaws.com/my-test-repo`

## App

Inside this folder we have the App itself and the Dockerfile that will create the container image that need to be pushed to AWS ECR repository.

There's a tutorial [here](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html)with more deep instructions and how to use docker and push images 

to Push with your account follow the steps below:

Authentica with your account.
1 - `AWS_PROFILE=user-root-test aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin <change-your-id-here>.dkr.ecr.ap-southeast-2.amazonaws.com`

Build your Docker image using the following command.
2 - `docker build -t my-test-repo .`

After the build completes, tag your image so you can push the image to this repository:
3 - `AWS_PROFILE=user-root-test docker tag my-test-repo:latest <change-your-id-here>.dkr.ecr.ap-southeast-2.amazonaws.com/my-test-repo:latest`

Run the following command to push this image to your newly created AWS repository:
4 - `AWS_PROFILE=user-root-test docker push <change-your-id-here>.dkr.ecr.ap-southeast-2.amazonaws.com/my-test-repo:latest`


This process could take some time if the image is to big or internet connection is not fast enough to upload the container layers.

## Main-terraform 

Here's where the magic happens all the Terraform files will create resources to build the infrastructure to run and keep the resources health.

We have the ECS cluster defined here with the Load Balancer, Instances, Scaling groups

We have to be carefull here and change the variable to each resource that was created on previous steps

**`key_name` is the key pair used to create resources within EC2, go to AWS UI - EC2->Network & Security->Key pairs to generate one** 

Open `variables.tf` and replace all variable defined there with your one values.

Also within the `templates `folder it's need to be replace the repository name with your own credentials

e.g ` "image": "<change-your-id-here>.dkr.ecr.ap-southeast-2.amazonaws.com/my-test-repo:latest",`


```
environment             = "sandbox-env" #name od environment
region                  = "ap-southeast-2" 
owner-resource          = "<set the name of Resource owner>" #example
vpc_id                  = "vpc-0fb91579977406404" #change with your vpc ID, check VPC output 
public_subnets          = ["subnet-0e2a0350b48de2c77", "subnet-0e57a37312ff05cf5", "subnet-0f8cec80959cd691f" ]  # change each public subnet id to have proper connectivity
key_name                = "my-test-instance" # This need to be create before apply the TF
cluster_name            = "my-test-cluster" # change the ECR cluster name
launch-config           = "ecs-lc-test"  # define Launch configuration name


```

**Inicialize terraform**
```
AWS_PROFILE=user-root-test terraform init
```

**Plan/Apply the Main Terraform deployment**

```
AWS_PROFILE=user-root-test terraform plan -var-file=ap-southeast-2.tfvars

AWS_PROFILE=user-root-test terraform apply -var-file=ap-southeast-2.tfvars

```

The Application should be running at the ALB (Application Load balance) URL 
![image](https://user-images.githubusercontent.com/5950117/109585052-da038600-7b56-11eb-9b73-fa2225920f79.png)


``E.g http://test-ecs-lb-1386905905.ap-southeast-2.elb.amazonaws.com/``

![image](https://user-images.githubusercontent.com/5950117/109585130-04edda00-7b57-11eb-9f0f-c839f6036236.png)



## Destroy the environment 

If this function will be used for learn purposes **don't forget** to destroy the resources because AWS could charge you if keep it running.


**Destroying the Main Terraform deployment**

```
AWS_PROFILE=user-root-test terraform destroy -var-file=ap-southeast-2.tfvars
```

**Destroying the ECR-repository Terraform**

```
cd ecr-repository/
AWS_PROFILE=user-root-test terraform destroy -var-file=ap-southeast-2.tfvars
```

**Destroying the VPC**

```
cd vpc/build-vpc/
AWS_PROFILE=user-root-test terraform destroy -var-file=ap-southeast-2.tfvars
```

**Destroying the Terraform-state deployment**

```
cd terraform-state/
AWS_PROFILE=user-root-test terraform destroy -var-file=ap-southeast-2.tfvars
```







