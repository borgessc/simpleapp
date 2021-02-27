variable "vpc_id" {
  description = "The ID of the inter-region VPC"
  type        = string
}

variable "subnet_name" {
  description = "The name that will be given the the subnet"
  type        = string
  default     = "Managed Subnet"
}

variable "subnet_cidr_block" {
  description = "The CIDR block that will be associated with the private subnet that is being created"
  type        = string
}

variable "availability_zone" {
  description = "The AWS avaliablitity zone the subnet will be provisoned in"
  type        = string
}

variable "route_table_id" {
  description = "The Route table ID used for the public subnets"
  type        = string
}

variable "name" {
  description = "Used for tagging. The name tag allows to catergoise the use of the subnet"
  default     = ""
}

variable "public_ip" {
  default     = false
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
}
