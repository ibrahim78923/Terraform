module "ecs" {
  source = "../../modules/ecs"

  cluster_name              = var.cluster_name
  enable_container_insights = var.enable_container_insights
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name        = var.repository_name
  image_tag_mutability   = var.image_tag_mutability
  scan_on_push           = var.scan_on_push
}
