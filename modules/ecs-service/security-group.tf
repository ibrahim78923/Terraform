resource "aws_security_group" "service" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name} ECS service"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.container_port != null && var.alb_security_group_id != null ? [1] : []

    content {
      description     = "Traffic from ALB"
      from_port       = var.container_port
      to_port         = var.container_port
      protocol        = "tcp"
      security_groups = [var.alb_security_group_id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}
