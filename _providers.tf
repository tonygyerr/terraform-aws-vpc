provider "aws" {
  version = "~> 2.0"
  region = var.aws_region
  profile = "default"
}

terraform {
  backend "s3" {
  }
}