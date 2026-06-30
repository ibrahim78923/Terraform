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
