variable "alb_name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the ALB (minimum 2 in different AZs)."
  type        = list(string)
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
  description = "Optional ACM certificate ARN. If not set, a self-signed certificate is created for dev use."
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
