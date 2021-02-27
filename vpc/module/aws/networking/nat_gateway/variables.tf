variable "private_subnet_route_table_id" {
  description = "The route table ID associated with the private subnet that will route to the NAT Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID in which the NAT Gateway will be placed"
  type        = string
}
