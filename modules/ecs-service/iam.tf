data "aws_iam_policy_document" "ecs_task_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "execution" {
  name = "${var.name}-execution-role"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json

  tags = {
    Name = "${var.name}-execution-role"
  }
}

resource "aws_iam_role_policy_attachment" "execution" {
  role       = aws_iam_role.execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_kms_key" "ssm" {
  count  = length(var.secrets) > 0 ? 1 : 0
  key_id = "alias/aws/ssm"
}

data "aws_iam_policy_document" "ssm_secrets" {
  count = length(var.secrets) > 0 ? 1 : 0

  statement {
    actions = ["ssm:GetParameters"]
    resources = values(var.secrets)
  }

  statement {
    actions   = ["kms:Decrypt"]
    resources = [data.aws_kms_key.ssm[0].arn]
  }
}

resource "aws_iam_role_policy" "ssm_secrets" {
  count = length(var.secrets) > 0 ? 1 : 0

  name   = "${var.name}-ssm-secrets"
  role   = aws_iam_role.execution.id
  policy = data.aws_iam_policy_document.ssm_secrets[0].json
}

resource "aws_iam_role" "task" {
  name = "${var.name}-task-role"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json

  tags = {
    Name = "${var.name}-task-role"
  }
}
