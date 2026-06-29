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

variable "vpc_name_prefix" {
  description = "Prefix used for VPC and subnet resource names."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster."
  type        = string
}

variable "enable_container_insights" {
  description = "Enable CloudWatch Container Insights for the ECS cluster."
  type        = bool
}

variable "repository_name" {
  description = "Name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "Whether ECR image tags can be overwritten. Valid values: MUTABLE or IMMUTABLE."
  type        = string
}

variable "scan_on_push" {
  description = "Enable ECR image scanning when images are pushed."
  type        = bool
}

variable "alb_name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal-only."
  type        = bool
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection on the ALB."
  type        = bool
}

variable "target_group_port" {
  description = "Port for the default target group."
  type        = number
}

variable "health_check_path" {
  description = "Health check path for the default target group."
  type        = string
}
