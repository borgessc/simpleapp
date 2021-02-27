output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "default_network_acl_id" {
  value = aws_vpc.vpc.default_network_acl_id
}

output "default_security_group_id" {
  value = aws_vpc.vpc.default_security_group_id
}

output "default_route_table_id" {
  value = aws_vpc.vpc.default_route_table_id
}
