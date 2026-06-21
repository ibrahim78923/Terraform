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
