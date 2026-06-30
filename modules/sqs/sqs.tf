locals {
  queues = {
    for base in var.queue_bases : base => "${base}-${var.environment}"
  }
}

resource "aws_sqs_queue" "this" {
  for_each = local.queues

  name = each.value

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds                = var.delay_seconds
  max_message_size             = var.max_message_size
  receive_wait_time_seconds    = var.receive_wait_time_seconds
  sqs_managed_sse_enabled      = var.sqs_managed_sse_enabled

  tags = merge(var.tags, {
    Name = each.value
  })
}
