data "aws_availability_zones" "main" {}

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "null_data_source" "terraform_tags" {
  inputs = {
    "heritage"      = "Terraform"
    "environment"   = var.environment
    "module"        = "vpc"
    "moduleVersion" = lookup(var.module_config, "moduleVersion")
  }
}