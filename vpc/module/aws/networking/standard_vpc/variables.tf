variable "cidr_block" {
  description = "The CIDR block that will be assigned to this VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name specified with the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = false
}

variable "availability_zones_details" {
  description = "Details of availability zones to setup in VPC. This should be a list of maps with each map containing the following keys: availability_zone, public_subnet_cidr_block, private_subnet_cidr_block"
  type        = list(map(string))
}

variable "vpc_tags" {
  description = "A mapping of additional tags to assign to the vpc resource."
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "A mapping of additional tags to assign to the public subnet resources."
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "A mapping of additional tags to assign to the private subnet resources."
  type        = map(string)
  default     = {}
}
