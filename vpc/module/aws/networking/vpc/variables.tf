variable "cidr_block" {
  description = "The CIDR block that will be assigned to this VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name specified with the VPC"
  type        = string
  default     = "VPC"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = false
}

variable "internet_gateway_name" {
  description = "The name specified with the VPC"
  type        = string
  default     = "internet-gateway"
}
