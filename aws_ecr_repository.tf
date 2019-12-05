resource "aws_ecr_repository" "ecr" {
  name = "${lookup(var.settings, "ecr_repository_name")}"
}
