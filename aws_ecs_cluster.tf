resource "aws_ecs_cluster" "cluster" {
  name = "${var.settings.app_name}-${terraform.workspace}"
}
