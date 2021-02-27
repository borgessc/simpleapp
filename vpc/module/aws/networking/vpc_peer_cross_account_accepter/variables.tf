variable "name" {
  description = "The name to associate with the VPC Peering Connection."
}

variable "vpc_peering_connection_id" {
  description = "The VPC Peering Connection ID to manage."
}

variable "route_table_ids" {
  description = "A list of routing table IDs in the accepter VPC of the VPC Peering Connection for which routing table entries are created."
  type        = list(string)
}

variable "destination_cidr_block" {
  description = "The CIDR block of the requester VPC of the VPC Peering Connection."
}
