data "null_data_source" "subnet_cidr_blocks" {
  inputs = {
    public_subnet_az1  = cidrsubnet(var.vpc_cidr_block, 4, 0)
    public_subnet_az2  = cidrsubnet(var.vpc_cidr_block, 4, 1)
    public_subnet_az3  = cidrsubnet(var.vpc_cidr_block, 4, 2)

    private_subnet_az1 = cidrsubnet(var.vpc_cidr_block, 2, 1)
    private_subnet_az2 = cidrsubnet(var.vpc_cidr_block, 2, 2)
    private_subnet_az3 = cidrsubnet(var.vpc_cidr_block, 2, 3)
  }
}
