output "queue_names" {
  description = "Map of base name to full SQS queue name."
  value       = local.queues
}

output "queue_urls" {
  description = "Map of base name to SQS queue URL."
  value       = { for base, queue in aws_sqs_queue.this : base => queue.url }
}

output "queue_arns" {
  description = "Map of base name to SQS queue ARN."
  value       = { for base, queue in aws_sqs_queue.this : base => queue.arn }
}
