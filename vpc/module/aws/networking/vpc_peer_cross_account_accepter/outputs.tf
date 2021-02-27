output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection_accepter.peer.id
}

output "route_ids" {
  value = aws_route.peer.*.id
}
