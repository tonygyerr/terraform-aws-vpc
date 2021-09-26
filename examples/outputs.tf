output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "db_subnet_group_name" {
  value = module.vpc.db_subnet_group_name
}

output "public_api_subnets" {
  value = [module.vpc.public_api_subnets]
}

output "private_api_subnets" {
  value = [module.vpc.private_api_subnets]
}

output "private_db_subnets" {
  value = [module.vpc.private_db_subnets]
}

output "private_lb_subnets" {
  value = [module.vpc.private_lb_subnets]
}

output "api_security_group_id" {
  value = [module.vpc.api_security_group_id]
}

output "route_table_pub_id" {
  value = [module.vpc.route_table_pub_id]
}

output "route_table_prv_id" {
  value = [module.vpc.route_table_prv_id]
}