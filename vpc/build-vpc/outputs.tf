output "vpc_id" {
  value = module.build-vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.build-vpc.vpc_cidr_block
}

output "vpc_default_security_group_id" {
  value = module.build-vpc.vpc_default_security_group_id
}

output "vpc_default_network_acl_id" {
  value = module.build-vpc.vpc_default_network_acl_id
}

output "vpc_default_route_table_id" {
  value = module.build-vpc.vpc_default_route_table_id
}

output "az_1_private_subnet_id" {
  value = module.build-vpc.private_subnet_ids[0]
}

output "az_1_private_subnet_route_table_id" {
  value = module.build-vpc.private_subnet_route_table_ids[0]
}

output "az_2_private_subnet_id" {
  value = module.build-vpc.private_subnet_ids[1]
}

output "az_2_private_subnet_route_table_id" {
  value = module.build-vpc.private_subnet_route_table_ids[1]
}

output "az_3_private_subnet_id" {
  value = module.build-vpc.private_subnet_ids[2]
}

output "az_3_private_subnet_route_table_id" {
  value = module.build-vpc.private_subnet_route_table_ids[2]
}

output "internet_gateway_id" {
  value = module.build-vpc.internet_gateway_id
}

output "az_1_nat_gateway_id" {
  value = module.build-vpc.nat_gateway_ids[0]
}

output "az_2_nat_gateway_id" {
  value = module.build-vpc.nat_gateway_ids[1]
}

output "az_3_nat_gateway_id" {
  value = module.build-vpc.nat_gateway_ids[2]
}

output "az_1_public_subnet_id" {
  value = module.build-vpc.public_subnet_ids[0]
}

output "az_2_public_subnet_id" {
  value = module.build-vpc.public_subnet_ids[1]
}

output "az_3_public_subnet_id" {
  value = module.build-vpc.public_subnet_ids[2]
}
