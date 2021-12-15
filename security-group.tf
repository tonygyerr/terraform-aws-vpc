resource "aws_security_group" "app" {
  name        = "${var.project}-${var.environment}-prv-sg"
  description = "allow private incoming http connections"

  lifecycle {
    create_before_destroy = true
  }

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = var.private_subnets
  # }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_config.cidr]
  }

  # ingress {
  #   from_port   = 3000
  #   to_port     = 3000
  #   protocol    = "tcp"
  #   cidr_blocks = var.db_prv_subnets
  # }

  # ingress {
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = var.db_prv_subnets
  # }

  # ingress {
  #   from_port   = 5432
  #   to_port     = 5432
  #   protocol    = "tcp"
  #   cidr_blocks = var.db_prv_subnets
  # }

  # ingress {
  #   from_port   = 8080
  #   to_port     = 8080
  #   protocol    = "tcp"
  #   cidr_blocks = var.private_subnets
  # }

  # ingress {
  #   from_port   = 9000
  #   to_port     = 9000
  #   protocol    = "tcp"
  #   cidr_blocks = var.private_subnets
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.open_cidr]
  }
  vpc_id = aws_vpc.this.id
}

resource "aws_security_group_rule" "app"{
  type = "ingress"
  from_port   = 0 
  to_port     = 65535 
  protocol    = "tcp"
  security_group_id = aws_security_group.app.id
  source_security_group_id = aws_security_group.app.id
}