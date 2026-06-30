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

module "ssm" {
  source = "../../modules/ssm"

  prefix     = var.ssm_parameter_prefix
  parameters = var.ssm_parameters

  tags = local.common_tags
}

module "sqs" {
  source = "../../modules/sqs"

  environment                  = var.environment
  queue_bases                  = var.sqs_queue_bases
  visibility_timeout_seconds   = var.sqs_visibility_timeout_seconds
  message_retention_seconds    = var.sqs_message_retention_seconds
  delay_seconds                = var.sqs_delay_seconds
  max_message_size             = var.sqs_max_message_size
  receive_wait_time_seconds    = var.sqs_receive_wait_time_seconds
  sqs_managed_sse_enabled      = var.sqs_managed_sse_enabled
  tags                         = local.common_tags
}

module "backend_service" {
  source = "../../modules/ecs-service"

  name                  = var.backend_service_name
  aws_region            = var.aws_region
  cluster_arn           = module.ecs.ecs_cluster_arn
  image_uri             = "${module.ecr.repository_url}:${var.image_tag}"
  cpu                   = var.backend_cpu
  memory                = var.backend_memory
  desired_count         = var.backend_desired_count
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  container_port        = var.backend_container_port
  target_group_arn      = module.alb.target_group_arn
  alb_security_group_id = module.alb.security_group_id
  command               = var.backend_command
  secrets               = module.ssm.parameter_arns
  environment = merge(
    {
      APP_MODE = "backend"
    },
    var.backend_environment
  )
}

module "worker_service" {
  source = "../../modules/ecs-service"

  name          = var.worker_service_name
  aws_region    = var.aws_region
  cluster_arn   = module.ecs.ecs_cluster_arn
  image_uri     = "${module.ecr.repository_url}:${var.image_tag}"
  cpu           = var.worker_cpu
  memory        = var.worker_memory
  desired_count = var.worker_desired_count
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  command       = var.worker_command
  secrets       = module.ssm.parameter_arns
  environment = merge(
    {
      APP_MODE = "worker"
    },
    var.worker_environment
  )
}
