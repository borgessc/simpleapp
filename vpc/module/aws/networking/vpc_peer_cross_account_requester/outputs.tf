output "vpc_peering_connection_id" {
  value = join("", aws_vpc_peering_connection.peer.*.id)
}

output "route_id" {
  value = join("", aws_route.peer.*.id)
}
