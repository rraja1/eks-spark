resource "aws_ecr_repository" "springboot-demo" {
  name                 = "springboot-demo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}