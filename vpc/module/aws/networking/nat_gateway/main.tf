resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Purpose = "nat-gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Tribe   = var.tribe_owner
    Purpose = "nat-gateway"
  }
}

resource "aws_route" "ngw_route" {
  route_table_id         = var.private_subnet_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
