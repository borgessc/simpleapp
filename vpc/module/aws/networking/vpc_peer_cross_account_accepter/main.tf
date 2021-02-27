resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = var.vpc_peering_connection_id
  auto_accept               = true

  tags = {
    Name    = var.name
  }
}

resource "aws_route" "peer" {
  count = length(var.route_table_ids)

  route_table_id            = var.route_table_ids[count.index]
  destination_cidr_block    = var.destination_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
}
