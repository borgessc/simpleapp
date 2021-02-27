resource "aws_route_table" "private_subnet_route_table" {
  count = length(var.availability_zones_details)

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.vpc_name} Private Subnet Route Table ${var.availability_zones_details[count.index]["availability_zone"]}"

  }
}

resource "aws_default_route_table" "vpc_default_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags = {
    Name    = "${var.vpc_name} Default Route Table"

  }
}

resource "aws_route" "ngw_route" {
  count = length(var.availability_zones_details)

  route_table_id         = element(aws_route_table.private_subnet_route_table.*.id, count.index)
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_default_route_table.vpc_default_route_table.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_subnet_rt_assoc" {
  count = length(var.availability_zones_details)

  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_default_route_table.vpc_default_route_table.id
}

resource "aws_route_table_association" "private_subnet_rt_assoc" {
  count = length(var.availability_zones_details)

  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_subnet_route_table.*.id, count.index)
}
