output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  value = [module.vpc.public_subnets]
}

output "private_subnets" {
  value = [module.vpc.private_subnets]
}

output "private_db_subnets" {
  value = [module.vpc.private_db_subnets]
}

output "security_group_id" {
  value = [module.vpc.security_group_id]
}
 
output "route_table_pub_id" {
  value = module.vpc.route_table_pub_id
}

output "route_table_prv_id" {
  value = module.vpc.route_table_prv_id
}