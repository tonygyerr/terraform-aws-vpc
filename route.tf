#resource "aws_route" "r" {
#  count             = lookup(var.vpn_config, "enabled", false) != "" ? 1 : 0 

#  route_table_id    = aws_route_table.private[count.index]
#route_table_id    = aws_route_table.private.id
#  nat_gateway_id    = aws_nat_gateway.api-lb-ngw[count.index]
#  destination_cidr_block  = var.open_cidr
#}

resource "aws_route_table" "public" {
  count  = var.number_public_rt
  vpc_id = aws_vpc.api-vpc.id

  route {
    cidr_block = var.open_cidr
    gateway_id = aws_internet_gateway.api-ig.id
  }
}

resource "aws_route_table" "private" {
  count  = var.number_private_rt
  vpc_id = aws_vpc.api-vpc.id
}

resource "aws_route_table_association" "pub-assoc-api" {
  count           = var.number_public_rt
  subnet_id       = element(aws_subnet.api_subnet_pub.*.id, count.index)
  route_table_id  = element(aws_route_table.public.*.id, count.index)
  # route_table_id  = aws_route_table.public.id
}

resource "aws_route_table_association" "prv-assoc-api" {
  count           = var.number_rt
  subnet_id       = element(aws_subnet.api_subnet_prv.*.id, count.index)
  route_table_id  = element(aws_route_table.private.*.id, count.index)
  # route_table_id  = aws_route_table.private.id
}

resource "aws_route_table_association" "prv-assoc-db" {
  count           = var.number_rt
  subnet_id       = element(aws_subnet.db_subnet_prv.*.id, count.index)
  route_table_id  = element(aws_route_table.private.*.id, count.index)
  # route_table_id  = aws_route_table.private.id
}

resource "aws_route_table_association" "prv-assoc-lb" {
  count           = var.number_rt
  subnet_id       = element(aws_subnet.lb_subnet_prv.*.id, count.index)
  route_table_id  = element(aws_route_table.private.*.id, count.index)
  # route_table_id  = aws_route_table.private.id
}