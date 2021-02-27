# VPC Outputs

output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.vpc.cidr_block
  description = "The CIDR block of the VPC"
}

output "vpc_arn" {
  value       = aws_vpc.vpc.arn
  description = "The ARN of the created VPC"
}

output "vpc_enable_dns_support" {
  value       = aws_vpc.vpc.enable_dns_support
  description = "Whether or not the VPC has DNS support"
}

output "vpc_enable_dns_hostnames" {
  value       = aws_vpc.vpc.enable_dns_hostnames
  description = "Whether or not the VPC has DNS hostname support"
}

output "vpc_main_route_table_id" {
  value       = aws_vpc.vpc.main_route_table_id
  description = "The ID of the main route table associated with this VPC"
}

output "vpc_default_network_acl_id" {
  value       = aws_vpc.vpc.default_network_acl_id
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = aws_vpc.vpc.default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}

output "vpc_default_route_table_id" {
  value       = aws_default_route_table.vpc_default_route_table.id
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_ipv6_association_id" {
  value       = aws_vpc.vpc.ipv6_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "vpc_ipv6_cidr_block" {
  value       = aws_vpc.vpc.ipv6_cidr_block
  description = "The IPv6 CIDR block."
}

output "vpc_owner_id" {
  value       = aws_vpc.vpc.owner_id
  description = "The ID of the AWS account that owns the VPC."
}

# Subnet Outputs

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet.*.id
  description = "The IDs of the public subnets"
}

output "public_subnet_arns" {
  value       = aws_subnet.public_subnet.*.arn
  description = "The ARN of the public subnets."
}

output "private_subnet_arns" {
  value       = aws_subnet.private_subnet.*.arn
  description = "The ARN of the private subnets."
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnet.*.id
  description = "The IDs of the private subnets"
}

# Route Table Outputs

output "private_subnet_route_table_ids" {
  value       = aws_route_table.private_subnet_route_table.*.id
  description = "The IDs of the private subnets routing table"
}

# NAT Gateway Outputs

output "nat_gateway_ids" {
  value       = aws_nat_gateway.nat_gateway.*.id
  description = "The ID of the NAT Gateways."
}

output "nat_gateway_private_ips" {
  value       = aws_nat_gateway.nat_gateway.*.private_ip
  description = "The private IP address of the NAT Gateways."
}

output "nat_gateway_public_ips" {
  value       = aws_nat_gateway.nat_gateway.*.public_ip
  description = "The public IP address of the NAT Gateways."
}

output "nat_gateway_allocation_ids" {
  value       = aws_nat_gateway.nat_gateway.*.allocation_id
  description = "The Allocation IDs of the Elastic IP address for the NAT gateways."
}

output "nat_gateway_network_interface_ids" {
  value       = aws_nat_gateway.nat_gateway.*.network_interface_id
  description = "The ENI IDs of the network interface created by the NAT gateways"
}

# Internet Gateway Outputs

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The internet gateway ID that is attached to the VPC"
}
