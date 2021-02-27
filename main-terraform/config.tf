terraform {
  backend "s3" {
    key            = "aws-infrastructure/app/main-app.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-lock"
  }
}
#
