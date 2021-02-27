variable "name" {
  description = "The name to associate with the VPC Peering Connection."
}

# Requester Account Details
variable "vpc_id" {
  description = "The ID of the requester VPC."
}

variable "route_table_ids" {
  description = "The IDs of the requester routing tables."
  type        = list(string)
}

# Accepter Account Details
variable "peer_owner_id" {
  description = "The ID of the AWS Account that owns the accepter VPC with which you are creating the VPC Peering Connection. Resources are only created if this variable is a non-empty string."
}

variable "peer_region" {
  description = "The region of the accepter VPC of the VPC Peering Connection."
}

variable "peer_vpc_id" {
  description = "The ID of the accepter VPC with which you are creating the VPC Peering Connection."
}

variable "peer_cidr_block" {
  description = "The CIDR block of the accepter VPC with which you are creating the VPC Peering Connection."
}
