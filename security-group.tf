resource "aws_security_group" "api-prv-sg" {
  name        = "${var.project}-${var.environment}-prv-sg"
  description = "allow private incoming http connections"

  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.ecs01_subnet_prv}", "${var.ecs02_subnet_prv}", "${var.ecs03_subnet_prv}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.ecs01_subnet_prv}", "${var.ecs02_subnet_prv}", "${var.ecs03_subnet_prv}"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.ecs01_subnet_prv}", "${var.ecs02_subnet_prv}", "${var.ecs03_subnet_prv}"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.db01_subnet_prv}", "${var.db02_subnet_prv}", "${var.db03_subnet_prv}"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["${var.ecs01_subnet_prv}", "${var.ecs02_subnet_prv}", "${var.ecs03_subnet_prv}"]
  }

  egress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["${var.db01_subnet_prv}", "${var.db02_subnet_prv}", "${var.db03_subnet_prv}"]
  }
  vpc_id = aws_vpc.api-vpc.id
}