# Source VPC
resource "aws_vpc_peering_connection" "source" {
  count  = var.environment_exists ? 1 : 0
  vpc_id = data.aws_vpc.source.id

  peer_owner_id = data.aws_caller_identity.target.account_id
  peer_vpc_id   = data.aws_vpc.target[0].id
  peer_region   = var.target_region

  auto_accept = false

  accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution_acceptor
  }

  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution_requestor
  }

  tags = {
    Name  = var.peering_name
  }
}

resource "aws_route" "egress" {
  count                     = var.environment_exists ? 1 : 0
  route_table_id            = data.aws_route_table.source.id
  destination_cidr_block    = data.aws_vpc.target[0].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.source[0].id
}

# Remote VPC
resource "aws_vpc_peering_connection_accepter" "target" {
  count                     = var.environment_exists ? 1 : 0
  provider                  = aws.target
  vpc_peering_connection_id = aws_vpc_peering_connection.source[0].id
  auto_accept               = true

  tags = {
    Name  = var.peering_name
  }
}

resource "aws_route" "ingress" {
  provider = aws.target
  count    = var.environment_exists ? length(distinct(data.aws_route_tables.target[0].ids)) : 0
  route_table_id = element(
    distinct(data.aws_route_tables.target[0].ids),
    count.index,
  )

  destination_cidr_block    = data.aws_vpc.source.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.source[0].id
}
