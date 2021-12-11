resource "aws_route_table" "public" {
  count  = var.number_public_rt
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.open_cidr
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.app_name}-${var.environment}-public-rt"
  }
}

resource "aws_route_table" "private" {
  count  = var.number_private_rt
  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = var.open_cidr
    nat_gateway_id = aws_nat_gateway.this[0].id
  }
  tags = {
    Name = "${var.app_name}-${var.environment}-private-rt"
  }
}

resource "aws_route_table_association" "pub-assoc-api" {
  count          = var.number_rt
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table_association" "prv-assoc-api" {
  count          = var.number_rt
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route_table_association" "prv-assoc-db" {
  count          = var.number_rt
  subnet_id      = element(aws_subnet.db_private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route_table_association" "prv-assoc-elasticache" {
  count          = var.number_rt
  subnet_id      = element(aws_subnet.elasticache_private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}