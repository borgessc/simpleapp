output "nat_gateway_id" {
  value       = aws_nat_gateway.nat_gateway.id
  description = "The ID of the NAT Gateway created"
}

output "allocation_id" {
  value       = aws_nat_gateway.nat_gateway.allocation_id
  description = "The allocation ID of the Elastic IP address assigned to the NAT gateway"
}
