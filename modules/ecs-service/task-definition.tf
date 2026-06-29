locals {
  container_definitions = [
    merge(
      {
        name      = var.name
        image     = var.image_uri
        essential = true
        environment = [
          for key, value in var.environment : {
            name  = key
            value = value
          }
        ]
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            "awslogs-group"         = aws_cloudwatch_log_group.main.name
            "awslogs-region"        = var.aws_region
            "awslogs-stream-prefix" = "ecs"
          }
        }
      },
      length(var.command) > 0 ? { command = var.command } : {},
      length(var.secrets) > 0 ? {
        secrets = [
          for name, arn in var.secrets : {
            name      = name
            valueFrom = arn
          }
        ]
      } : {},
      var.container_port != null ? {
        portMappings = [
          {
            containerPort = var.container_port
            hostPort      = var.container_port
            protocol      = "tcp"
          }
        ]
      } : {}
    )
  ]
}

resource "aws_ecs_task_definition" "main" {
  family                   = var.name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.execution.arn
  task_role_arn            = aws_iam_role.task.arn

  container_definitions = jsonencode(local.container_definitions)

  tags = {
    Name = var.name
  }
}
