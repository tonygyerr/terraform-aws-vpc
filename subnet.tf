resource "aws_subnet" "api_subnet_pub" {
  count                   = var.amount_public_api_subnets
  cidr_block              = element(concat(var.api_pub_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.api-vpc.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.api-ig]

  tags = {
    Name = "${var.application}-${var.environment}-pub-${count.index}-subnet"
  }
}

resource "aws_subnet" "api_subnet_prv" {
  count                   = var.amount_private_api_subnets
  cidr_block              = element(concat(var.api_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.api-vpc.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.application}-${var.environment}-prv-${count.index}-subnet"
  }
}

resource "aws_subnet" "db_subnet_prv" {
  count                   = var.amount_private_db_subnets
  cidr_block              = element(concat(var.db_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.api-vpc.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.application}-${var.environment}-db-prv-${count.index}-subnet"
  }
}

resource "aws_subnet" "lb_subnet_prv" {
  count                   = var.amount_private_lb_subnets
  cidr_block              = element(concat(var.lb_prv_subnets, [""]), count.index)
  vpc_id                  = aws_vpc.api-vpc.id
  availability_zone       = data.aws_availability_zones.main.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.application}-${var.environment}-lb-prv-${count.index}-subnet"
  }
}