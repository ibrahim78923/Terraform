output "prefix" {
  description = "SSM parameter path prefix."
  value       = "/${local.parameter_prefix}"
}

output "parameter_arns" {
  description = "Map of parameter key to ARN for ECS task definition secrets."
  value       = { for key, param in aws_ssm_parameter.this : key => param.arn }
}

output "parameter_names" {
  description = "Map of parameter key to full SSM parameter name."
  value       = { for key, param in aws_ssm_parameter.this : key => param.name }
}
