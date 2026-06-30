locals {
  queues = {
    for base in var.queue_bases : base => "${base}-${var.environment}"
  }
}

resource "aws_sqs_queue" "this" {
  for_each = local.queues

  name = each.value

  tags = merge(var.tags, {
    Name = each.value
  })
}
