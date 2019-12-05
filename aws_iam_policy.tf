resource "aws_iam_policy" "ecs-service-policy" {
  name = "${var.settings.app_name}-ecs-service-policy-${terraform.workspace}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "elasticloadbalancing:RegisterTargets"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "ecs-task-policy" {
  name = "${var.settings.app_name}-ecs-task-policy-${terraform.workspace}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstanceAttribute"
      ],
      "Resource": [
        "${aws_instance.main.arn}"
      ]
    }
  ]
}
POLICY
}
