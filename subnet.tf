resource "aws_subnet" "public" {
  count                   = var.amount_public_api_subnets
  cidr_block              = element(concat(var.api_pub_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.this.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.this]

  tags = {
    Name = "${var.app_name}-${var.environment}-pub-${count.index}-subnet"
  }
}

resource "aws_subnet" "app_private" {
  count                   = var.amount_private_api_subnets
  cidr_block              = element(concat(var.api_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.this.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app_name}-${var.environment}-prv-${count.index}-subnet"
  }
}

resource "aws_subnet" "db_private" {
  count                   = var.amount_private_db_subnets
  cidr_block              = element(concat(var.db_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.this.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app_name}-${var.environment}-db-prv-${count.index}-subnet"
  }
}

resource "aws_subnet" "lb_private" {
  count                   = var.amount_private_lb_subnets
  cidr_block              = element(concat(var.lb_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.this.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.app_name}-${var.environment}-lb-prv-${count.index}-subnet"
  }
}