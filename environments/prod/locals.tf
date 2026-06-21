locals {
  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "terraform"
      Project     = var.project_name
    },
    var.additional_tags
  )
}
