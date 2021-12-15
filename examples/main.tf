module "vpc" {
  # source = "git::git@github.com:TheBragHouse/BragHouse-Infrastructure-Module-Vpc.git"
  source = "git::https://github.com/tonygyerr/terraform-aws-vpc.git?ref=v1.0.0"
  app_name                 = var.app_name
  application              = var.app_name
  cidr                     = var.vpc_config.cidr
  enable_dynamodb_endpoint = true
  enable_nat_gateway       = true
  enable_s3_endpoint       = true
  enable_vpn_gateway       = true
  environment              = var.environment
  module_config            = var.module_config
  public_subnets           = var.public_subnets
  private_subnets          = var.private_subnets
  db_prv_subnets           = var.db_prv_subnets
  region                   = var.aws_region
  single_nat_gateway       = true
  vpc_config               = var.vpc_config
  vpn_config               = var.vpn_config
  vpn_ip_address           = var.vpn_ip_address
  tags                     = var.tags
}