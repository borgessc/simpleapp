resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zones_details)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.availability_zones_details[count.index]["public_subnet_cidr_block"]
  availability_zone       = var.availability_zones_details[count.index]["availability_zone"]
  map_public_ip_on_launch = "true"

  tags = merge(
    {
      "Name"    = "${var.vpc_name} Public Subnet ${var.availability_zones_details[count.index]["availability_zone"]}"
    },
    var.public_subnet_tags,
  )
}

resource "aws_subnet" "private_subnet" {
  count = length(var.availability_zones_details)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.availability_zones_details[count.index]["private_subnet_cidr_block"]
  availability_zone       = var.availability_zones_details[count.index]["availability_zone"]
  map_public_ip_on_launch = "false"

  tags = merge(
    {
      "Name"    = "${var.vpc_name} Private Subnet ${var.availability_zones_details[count.index]["availability_zone"]}"
    },
    var.private_subnet_tags,
  )
}
