variable "name" {
  description = "Name prefix for the ECS service and related resources."
  type        = string
}

variable "aws_region" {
  description = "AWS region used for CloudWatch logs."
  type        = string
}

variable "cluster_arn" {
  description = "ARN of the ECS cluster."
  type        = string
}

variable "image_uri" {
  description = "Full container image URI including tag."
  type        = string
}

variable "cpu" {
  description = "Fargate CPU units for the task."
  type        = number
}

variable "memory" {
  description = "Fargate memory (MiB) for the task."
  type        = number
}

variable "desired_count" {
  description = "Number of tasks to run."
  type        = number
}

variable "vpc_id" {
  description = "VPC ID for the service security group."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs where tasks will run."
  type        = list(string)
}

variable "container_port" {
  description = "Container port exposed by the task. Set to null for workers without a load balancer."
  type        = number
  default     = null
}

variable "target_group_arn" {
  description = "Optional ALB target group ARN for the service."
  type        = string
  default     = null
}

variable "alb_security_group_id" {
  description = "Optional ALB security group ID allowed to reach the container port."
  type        = string
  default     = null
}

variable "command" {
  description = "Optional container command override."
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Environment variables for the container."
  type        = map(string)
  default     = {}
}

variable "log_retention_in_days" {
  description = "CloudWatch log retention in days."
  type        = number
  default     = 7
}
