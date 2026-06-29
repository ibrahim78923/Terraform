output "ecs_cluster_id" {
  description = "ECS cluster ID."
  value       = module.ecs.ecs_cluster_id
}

output "ecs_cluster_name" {
  description = "ECS cluster name."
  value       = module.ecs.ecs_cluster_name
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN."
  value       = module.ecs.ecs_cluster_arn
}

output "ecr_repository_url" {
  description = "ECR repository URL."
  value       = module.ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ECR repository ARN."
  value       = module.ecr.repository_arn
}

output "ecr_repository_name" {
  description = "ECR repository name."
  value       = module.ecr.repository_name
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT gateway ID."
  value       = module.vpc.nat_gateway_id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer."
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "ARN of the default ALB target group."
  value       = module.alb.target_group_arn
}

output "https_listener_arn" {
  description = "ARN of the HTTPS listener."
  value       = module.alb.https_listener_arn
}

output "certificate_arn" {
  description = "ACM certificate ARN used by the HTTPS listener."
  value       = module.alb.certificate_arn
}

output "backend_service_name" {
  description = "Name of the backend ECS service."
  value       = module.backend_service.service_name
}

output "worker_service_name" {
  description = "Name of the worker ECS service."
  value       = module.worker_service.service_name
}

output "backend_log_group_name" {
  description = "CloudWatch log group for the backend service."
  value       = module.backend_service.log_group_name
}

output "worker_log_group_name" {
  description = "CloudWatch log group for the worker service."
  value       = module.worker_service.log_group_name
}

output "ssm_parameter_prefix" {
  description = "SSM parameter path prefix."
  value       = module.ssm.prefix
}

output "ssm_parameter_names" {
  description = "Map of env keys to full SSM parameter names."
  value       = module.ssm.parameter_names
}
