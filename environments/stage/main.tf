module "ecs" {
  source = "../../modules/ecs"

  cluster_name              = var.cluster_name
  enable_container_insights = var.enable_container_insights
}
