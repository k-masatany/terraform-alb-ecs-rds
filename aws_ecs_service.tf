resource "aws_ecs_service" "ecs-service" {
  name                               = "${var.settings.ecs_service_name}"
  cluster                            = "${aws_ecs_cluster.cluster.id}"
  task_definition                    = "${aws_ecs_task_definition.ecs-task.family}:${max("${aws_ecs_task_definition.ecs-task.revision}", "${data.aws_ecs_task_definition.ecs-task.revision}")}"
  desired_count                      = "${lookup(var.settings, "${terraform.workspace}.ecs_task_desired_count")}"
  deployment_minimum_healthy_percent = 50
  iam_role                           = "${aws_iam_role.ecs_service_role.arn}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.target_group.arn}"
    container_name   = "${var.settings.ecs_task_container_name}"
    container_port   = 80
  }

  depends_on = ["aws_alb_target_group.target_group"]
}
