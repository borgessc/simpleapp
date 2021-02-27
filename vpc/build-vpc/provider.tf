provider "aws" {
  version             = "~> 3.3.0"
  region              = var.region
  allowed_account_ids = var.aws_allowed_account_ids
}
