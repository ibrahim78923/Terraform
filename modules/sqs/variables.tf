variable "environment" {
  description = "Environment suffix appended to queue names (e.g. dev, stage, prod)."
  type        = string
}

variable "queue_bases" {
  description = "Base queue names without environment suffix. Final name: {base}-{environment}."
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to all SQS queues."
  type        = map(string)
  default     = {}
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for all queues."
  type        = number
}

variable "message_retention_seconds" {
  description = "Message retention period for all queues."
  type        = number
}

variable "delay_seconds" {
  description = "Delivery delay for all queues."
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Maximum message size in bytes (max 262144 = 256 KiB)."
  type        = number
  default     = 262144
}

variable "receive_wait_time_seconds" {
  description = "Long polling wait time for ReceiveMessage."
  type        = number
  default     = 0
}

variable "sqs_managed_sse_enabled" {
  description = "Enable server-side encryption with SQS-managed keys."
  type        = bool
  default     = true
}
