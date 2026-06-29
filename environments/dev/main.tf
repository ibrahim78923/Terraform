module "vpc" {
  source = "../../modules/vpc"

  name_prefix = var.vpc_name_prefix
  vpc_cidr    = var.vpc_cidr
}

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

module "alb" {
  source = "../../modules/alb"

  alb_name                   = var.alb_name
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.vpc.public_subnet_ids
  internal                   = var.internal
  enable_deletion_protection = var.enable_deletion_protection
  target_group_port          = var.target_group_port
  health_check_path          = var.health_check_path
  certificate_arn            = var.certificate_arn
  certificate_domain_name    = var.certificate_domain_name
  ssl_policy                 = var.ssl_policy
}
