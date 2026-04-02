resource "aws_ecr_repository" "catalogue" {
  name                 = "${var.project_name}/catlogue"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}