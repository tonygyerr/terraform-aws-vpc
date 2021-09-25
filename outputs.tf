output "vpc_id" {
  value = aws_vpc.api-vpc.id
}

output "eip_lb_ngw_id" {
  value = aws_eip.api-eip-lb-ngw.*.id
}

output "igw_id" {
  value = aws_internet_gateway.api-ig.id
}

output "public_api_subnets" {
  value = aws_subnet.api_subnet_pub.*.id
}

output "private_api_subnets" {
  value = aws_subnet.api_subnet_prv.*.id
}

output "private_db_subnets" {
  value = aws_subnet.db_subnet_prv.*.id
}

output "private_lb_subnets" {
  value = aws_subnet.lb_subnet_prv.*.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.apidb_subnet_group.name
}

output "api_security_group_id" {
  value = aws_security_group.app.id
}

output "route_table_pub_id" {
  value = aws_route_table.public.*.id
}

output "route_table_prv_id" {
  value = aws_route_table.private.*.id
}