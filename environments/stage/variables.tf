variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "project_name" {
  description = "Project name used in resource tags."
  type        = string
}

variable "additional_tags" {
  description = "Extra tags merged into default tags on all resources."
  type        = map(string)
  default     = {}
}

variable "cluster_name" {
  description = "Name of the ECS cluster."
  type        = string
}

variable "enable_container_insights" {
  description = "Enable CloudWatch Container Insights for the ECS cluster."
  type        = bool
}
