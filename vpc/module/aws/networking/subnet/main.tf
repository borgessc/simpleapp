resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.public_ip

  tags = {
    Name  = "${var.subnet_name} ${var.availability_zone}"
  }
}

resource "aws_route_table_association" "subnet_rt_assoc" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = var.route_table_id
}
