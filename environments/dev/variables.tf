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

variable "certificate_arn" {
  description = "Optional ACM certificate ARN. If not set, a self-signed certificate is created."
  type        = string
  default     = null
}

variable "certificate_domain_name" {
  description = "Common name for the self-signed certificate when certificate_arn is not set."
  type        = string
  default     = "localhost"
}

variable "ssl_policy" {
  description = "SSL policy for the HTTPS listener."
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "image_tag" {
  description = "Docker image tag to deploy from ECR."
  type        = string
}

variable "backend_service_name" {
  description = "Name of the backend ECS service."
  type        = string
}

variable "worker_service_name" {
  description = "Name of the worker ECS service."
  type        = string
}

variable "backend_cpu" {
  description = "Fargate CPU units for the backend task."
  type        = number
}

variable "backend_memory" {
  description = "Fargate memory (MiB) for the backend task."
  type        = number
}

variable "backend_desired_count" {
  description = "Desired number of backend tasks."
  type        = number
}

variable "backend_container_port" {
  description = "Container port exposed by the backend service."
  type        = number
}

variable "backend_command" {
  description = "Optional command override for the backend container."
  type        = list(string)
  default     = []
}

variable "backend_environment" {
  description = "Additional environment variables for the backend container."
  type        = map(string)
  default     = {}
}

variable "worker_cpu" {
  description = "Fargate CPU units for the worker task."
  type        = number
}

variable "worker_memory" {
  description = "Fargate memory (MiB) for the worker task."
  type        = number
}

variable "worker_desired_count" {
  description = "Desired number of worker tasks."
  type        = number
}

variable "worker_command" {
  description = "Optional command override for the worker container."
  type        = list(string)
  default     = []
}

variable "worker_environment" {
  description = "Additional environment variables for the worker container."
  type        = map(string)
  default     = {}
}

variable "ssm_parameter_prefix" {
  description = "SSM Parameter Store path prefix (e.g. agenticcreed/dev)."
  type        = string
  default     = "agenticcreed/dev"
}

variable "ssm_parameters" {
  description = "SSM parameter keys at /{ssm_parameter_prefix}/{key}. Values are set in AWS Console, not Terraform."
  type = map(object({
    secure      = optional(bool, false)
    description = optional(string, "")
  }))
  default = {}
}
