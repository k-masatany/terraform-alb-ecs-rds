resource "aws_cloudwatch_log_group" "log_group" {
  name              = "${var.settings.app_name}-${terraform.workspace}"
  retention_in_days = "${lookup(var.settings, "${terraform.workspace}.ecs_log_retention_in_days")}"

  tags = {
    Environment = "${terraform.workspace}"
    Application = "${var.settings.app_name}"
  }
}
