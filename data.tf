data "aws_availability_zones" "main" {}
data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "null_data_source" "environment" {
  inputs = map(
    "SDLC",
    lower(
      element(
        split("-", data.aws_iam_account_alias.current.account_alias),
        length(split("-", data.aws_iam_account_alias.current.account_alias)) - 1
    ))
  )
}

data "null_data_source" "terraform_tags" {
  inputs = {
    "heritage"      = "Terraform"
    "environment"   = data.null_data_source.environment.outputs["SDLC"]
    "module"        = "vpc"
    "moduleVersion" = lookup(var.module_config, "moduleVersion")
  }
}

data "null_data_source" "merged_tags" {
  inputs = merge(
    var.aabg_tags,
    data.null_data_source.terraform_tags.outputs,
    var.extra_tags
  )
}
