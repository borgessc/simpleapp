terraform {
  backend "s3" {
    key            = "aws-infrastructure/ecr/ecr-repo.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-lock"
  }
}
#
