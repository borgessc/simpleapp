data "aws_caller_identity" "target" {
  provider = aws.target
}

data "aws_vpc" "source" {
  id = var.source_vpc_id
}

data "aws_vpc" "target" {
  count    = var.environment_exists ? 1 : 0
  provider = aws.target
  id       = var.target_vpc_id
}

data "aws_route_table" "source" {
  vpc_id = data.aws_vpc.source.id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

data "aws_route_tables" "target" {
  count    = var.environment_exists ? 1 : 0
  provider = aws.target
  vpc_id   = data.aws_vpc.target[0].id
}
