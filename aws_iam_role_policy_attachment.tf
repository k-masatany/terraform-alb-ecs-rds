resource "aws_iam_role_policy_attachment" "service-role-attachment" {
  role       = "${aws_iam_role.ecs_service_role.name}"
  policy_arn = "${aws_iam_policy.ecs-service-policy.arn}"
}

resource "aws_iam_role_policy_attachment" "task-role-attachment" {
  role       = "${aws_iam_role.ecs_task_role.name}"
  policy_arn = "${aws_iam_policy.ecs-task-policy.arn}"
}
