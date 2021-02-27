variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "Build VPC"
}

variable "aws_allowed_account_ids" {
  type = list(string)
}

variable "region" {
  description = "The region the VPC will be created in"
  type        = string
}
