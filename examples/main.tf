module "vpc" {
  source                   = "git::ssh://git@github.com:tonygyerr/terraform-aws-vpc.git"
  # source                   = "../"
  api_prv_subnets          = var.api_prv_subnets
  api_pub_subnets          = var.api_pub_subnets
  application              = var.application
  azs                      = var.azs
  cidr                     = var.vpc_cidr
  db_prv_subnets           = var.db_prv_subnets
  db01_subnet_prv          = var.db01_subnet_prv
  db02_subnet_prv          = var.db02_subnet_prv
  db03_subnet_prv          = var.db03_subnet_prv
  ecs01_subnet_prv         = var.ecs01_subnet_prv
  ecs01_subnet_pub         = var.ecs01_subnet_pub
  ecs02_subnet_prv         = var.ecs02_subnet_prv
  ecs02_subnet_pub         = var.ecs02_subnet_pub
  ecs03_subnet_prv         = var.ecs03_subnet_prv
  ecs03_subnet_pub         = var.ecs03_subnet_pub
  enable_dynamodb_endpoint = true
  enable_nat_gateway       = true
  enable_s3_endpoint       = true
  enable_vpn_gateway       = true
  environment              = var.environment
  lb_prv_subnets           = var.lb_prv_subnets
  module_config            = var.module_config
  private_db_subnet_ids    = module.vpc.private_db_subnets
  private_subnets          = var.private_subnets
  region                   = var.aws_region
  single_nat_gateway       = true
  vpc_cidr                 = var.vpc_cidr
  vpc_config               = var.vpc_config
  vpc_id                   = module.vpc.vpc_id
  vpn_config               = var.vpn_config
}