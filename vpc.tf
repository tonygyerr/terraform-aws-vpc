resource "aws_vpc" "this" {
  cidr_block           = var.vpc_config["cidr"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = lookup(var.vpc_config, "instance_tenancy", "default")

  tags = merge(
    data.null_data_source.merged_tags.outputs,
    map(
      "Name", lookup(var.vpc_config, "name_prefix", "")
    )
  )
}
