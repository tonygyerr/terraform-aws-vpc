output "vpc_id" {
  value = aws_vpc.this.id
}

output "eip_lb_ngw_id" {
  value = aws_eip.this.*.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "public_api_subnets" {
  value = aws_subnet.public.*.id
}

output "private_api_subnets" {
  value = aws_subnet.app_private.*.id
}

output "private_db_subnets" {
  value = aws_subnet.db_private.*.id
}

output "private_lb_subnets" {
  value = aws_subnet.lb_private.*.id
}

output "api_security_group_id" {
  value = aws_security_group.vpc.id
}

output "route_table_pub_id" {
  value = aws_route_table.public.*.id
}

output "route_table_prv_id" {
  value = aws_route_table.private.*.id
}