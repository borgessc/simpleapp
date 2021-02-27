terraform {
  backend "s3" {
    key            = "aws-infrastructure/vpc/build-vpc.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-lock"
  }
}
#
