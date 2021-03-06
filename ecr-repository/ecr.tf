#
# ECR Resources
#
resource "aws_ecr_repository" "default" {
  name = var.repository_name
  image_scanning_configuration {
  scan_on_push = true
  }
  tags = {
    "enviroment" = var.environment
    "createdBy"  = var.owner-resource
  }
}

resource "aws_ecr_lifecycle_policy" "default" {
  count = var.attach_lifecycle_policy ? 1 : 0

  repository = aws_ecr_repository.default.name
  policy     = var.lifecycle_policy != "" ? var.lifecycle_policy : file("${path.module}/templates/default-lifecycle-policy.json.tpl")
}