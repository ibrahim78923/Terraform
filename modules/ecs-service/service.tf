resource "aws_ecs_service" "main" {
  name            = var.name
  cluster         = var.cluster_arn
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [aws_security_group.service.id]
    assign_public_ip = false
  }

  dynamic "load_balancer" {
    for_each = var.target_group_arn != null && var.container_port != null ? [1] : []

    content {
      target_group_arn = var.target_group_arn
      container_name   = var.name
      container_port   = var.container_port
    }
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  tags = {
    Name = var.name
  }

  depends_on = [aws_iam_role_policy_attachment.execution]
}
