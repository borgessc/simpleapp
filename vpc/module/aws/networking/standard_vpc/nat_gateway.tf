resource "aws_eip" "ngw_eip" {
  count = length(var.availability_zones_details)

  vpc = true

  tags = {
    
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.availability_zones_details)

  allocation_id = element(aws_eip.ngw_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)

  tags = {
    Name    = "${var.vpc_name} NAT Gateway ${var.availability_zones_details[count.index]["availability_zone"]}"
  }
}
