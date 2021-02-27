variable "source_vpc_id" {
  description = "The VPC ID for the source VPC to be peered"
  type        = string
}

variable "target_vpc_id" {
  description = "The VPC ID for the target VPC to be peered to"
  type        = string
}

variable "target_region" {
  description = "The AWS region the target VPC is provisioned in"
}

variable "allow_remote_vpc_dns_resolution_acceptor" {
  description = "Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC"
  default     = true
}

variable "allow_remote_vpc_dns_resolution_requestor" {
  description = "Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC"
  default     = true
}

variable "peering_name" {
  description = "The name given to the peering connection"
}

variable "environment_exists" {
  type = bool
}
