variable "region" {
  description = "Where the resources will be created"
  type        = string
  
}

variable "environment" {
  description = "Describe the environment that will be used to deploy a resource"
  type        = string
}

variable "key_name" {
  type        = string
  description = "The name for ssh key, used for aws_launch_configuration"
}

variable "cluster_name" {
  type        = string
  description = "The name of AWS ECS cluster"
}

variable "owner-resource" {
  description = "Who the resource belongs to (e.g a Group or a person)"
  type        = string
}

variable "public_subnets" {
    description = "All Internet face Subnets"
    type           = list
    default        = []
}

variable "vpc_id" {
  description = "Include the id from the main VPC"
  type = string
  
}
