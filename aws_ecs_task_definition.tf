data "template_file" "ecs-task" {
  template = "${file("${path.module}/task-definitions-${terraform.workspace}.tpl")}"

  vars = {
    container_name    = "${var.settings.ecs_task_container_name}"
    repository_url    = "${aws_ecr_repository.ecr.repository_url}"
    cpu               = "${lookup(var.settings, "${terraform.workspace}.ecs_task_cpu")}"
    memoryReservation = "${lookup(var.settings, "${terraform.workspace}.ecs_task_memoryReservation")}"
    log_group         = "${aws_cloudwatch_log_group.log_group.name}"
  }
}

resource "aws_ecs_task_definition" "ecs-task" {
  family                = "${var.settings.app_name}-${terraform.workspace}"
  container_definitions = "${data.template_file.ecs-task.rendered}"
  network_mode          = "bridge"
  task_role_arn         = "${aws_iam_role.ecs_task_role.arn}"
}

data "aws_ecs_task_definition" "ecs-task" {
  task_definition = "${aws_ecs_task_definition.ecs-task.arn}"
}

