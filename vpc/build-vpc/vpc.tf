module "build-vpc" {
  source      = "../module/aws/networking/standard_vpc"
  cidr_block  = var.vpc_cidr_block
  vpc_name    = var.vpc_name


  availability_zones_details = [
    {
      availability_zone         = "ap-southeast-2a"
      public_subnet_cidr_block  = data.null_data_source.subnet_cidr_blocks.outputs["public_subnet_az1"]
      private_subnet_cidr_block = data.null_data_source.subnet_cidr_blocks.outputs["private_subnet_az1"]
    },
    {
      availability_zone         = "ap-southeast-2b"
      public_subnet_cidr_block  = data.null_data_source.subnet_cidr_blocks.outputs["public_subnet_az2"]
      private_subnet_cidr_block = data.null_data_source.subnet_cidr_blocks.outputs["private_subnet_az2"]
    },
    {
      availability_zone         = "ap-southeast-2c"
      public_subnet_cidr_block  = data.null_data_source.subnet_cidr_blocks.outputs["public_subnet_az3"]
      private_subnet_cidr_block = data.null_data_source.subnet_cidr_blocks.outputs["private_subnet_az3"]
    },
  ]
}
