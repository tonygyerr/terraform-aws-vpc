variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

variable "module_config" {
  description = "configuration option for Module"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "cidr for vpc"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list(string)
  default     = ["10.0.0.48/28", "10.0.0.64/28", "10.0.0.80/28", "10.0.0.96/28", "10.0.0.112/28", "10.0.0.128/28", "10.0.0.144/28", "10.0.0.160/28", "10.0.0.176/28"]
}

variable "vpc_name" {
  description = "name of the vpc"
  default     = "api-vpc"
}

variable "vpc_default_name" {
  description = "name of the vpc"
  default     = "api-vpc-default"
}

variable "query_aws" {
  default = true
}

variable "extra_tags" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}

variable "tags_default" {
  type        = map(string)
  description = "optional default tags"

  default = {
    Name       = "default-api"
    Owner      = "cloudops@energy.com"
    CostCenter = "N/A"
    vpc        = "default"
    env        = "prd"
    project    = "default"
  }
}

variable "env" {
  type        = map(string)
  description = "enviornment"

  default = {
    dev  = "dev"
    test = "test"
    stg  = "stg"
    qa   = "qa"
    prd  = "prd"
    prd  = "prd"
  }
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "cost_center" {
  type    = string
  default = "N/A"
}

variable "owner" {
  type    = string
  default = "cloudops@energy.com"
}

variable "aws_region" {
  description = "ec2 region for the vpc"
  default     = "us-east-1"
}

variable "region" {
  description = "ec2 region for the vpc"
  default     = "east"
}

variable "default_vpc" {
  type    = string
  default = "default-api"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1d"]
}

variable "tier" {
  type        = map(string)
  description = "solution tier"

  default = {
    api  = "api"
    api  = "api"
    mgmt = "mgmt"
    web  = "web"
  }
}

variable "name" {
  description = "The domain name to setup DHCP for"
  default     = "api"
}

variable "domain_name" {
  description = "The internal DNS name to use with services"
  type        = string
  default     = "mywebsite.com corp.dir.energy.com energy.com ec2.internal"
}

variable "domain_name_servers" {
  description = "A comma separated list of the IP addresses of internal DHCP servers"
  type        = string
  default     = "172.28.34.219,172.28.37.121,AmazonProvidedDNS"
}

/*
 subnets
*/

variable "api_pub_subnets" {
  description = "ecs public subnets for the vpc"
  type        = list(string)
  default     = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
}

variable "api_prv_subnets" {
  description = "ecs private subnets for the vpc"
  type        = list(string)
  default     = ["10.0.0.48/28", "10.0.0.64/28", "10.0.0.80/28"]
}

variable "db_prv_subnets" {
  description = "database private subnets for the vpc"
  type        = list(string)
  default     = ["10.0.0.96/28", "10.0.0.112/28", "10.0.0.128/28"]
}

variable "lb_prv_subnets" {
  description = "load balancer private subnets for the vpc"
  type        = list(string)
  default     = ["10.0.0.144/28", "10.0.0.160/28", "10.0.0.176/28"]
}

/*
 default vpc
*/

variable "create_vpc" {
  type        = string
  description = "specify to create vpc"
  default     = "true"
}

variable "default_vpc_name" {
  description = "specify default vpc name"
  default     = "default-api"
}

variable "manage_default_vpc" {
  type        = string
  description = "specify to manage default vpc"
  default     = "false"
}

variable "default_vpc_enable_dynamodb_endpoint" {
  type        = string
  description = "specify to enable default vpc dynamodb endpoint"
  default     = "false"
}

variable "default_vpc_enable_dns_hostnames" {
  type        = string
  description = "specify to enable default vpc dns hostnames"
  default     = "false"
}

variable "default_vpc_enable_classiclink" {
  type        = string
  description = "specify to enable default vpc classic link"
  default     = "false"
}

variable "default_vpc_enable_dns_support" {
  type        = string
  description = "specify to enable default vpc dns support"
  default     = "false"
}

variable "default_vpc_create_database_subnet_group" {
  type        = string
  description = "specify to create database subnet group"
  default     = "false"
}

variable "default_vpc_enable_nat_gateway" {
  type        = string
  description = "specify to enable nat gateway"
  default     = "false"
}

variable "default_vpc_single_nat_gateway" {
  type        = string
  description = "specify to create single nat gateway"
  default     = "false"
}

variable "default_vpc_enable_vpn_gateway" {
  type        = string
  description = "specify to enable vpn gateway"
  default     = "false"
}

variable "default_vpc_enable_s3_endpoint" {
  type        = string
  description = "specify to enable s3 endpoint"
  default     = "false"
}

variable "owner_default_vpc" {
  type    = string
  default = "cloudops@energy.com"
}

variable "environment_default_vpc" {
  type    = string
  default = "none"
}

variable "aws_region_default_vpc" {
  description = "ec2 region for the vpc"
  default     = "us-east-1"
}

variable "application_default_vpc" {
  type    = string
  default = "default-api"
}

variable "region_default_vpc" {
  type    = string
  default = "us-east-1"
}

variable "cost_center_default_vpc" {
  type    = string
  default = "N/A"
}

variable "ecs01_subnet_prv" {
  #default = "ecs01_subnet_prv"
}

variable "ecs02_subnet_prv" {
  #default = "ecs02_subnet_prv"
}

variable "ecs03_subnet_prv" {
  #default = "ecs03_subnet_prv"
}

variable "ecs01_subnet_pub" {
  #default = "ecs01_subnet_pub"
}

variable "ecs02_subnet_pub" {
  #default = "ecs02_subnet_pub"
}

variable "ecs03_subnet_pub" {
  #default = "ecs03_subnet_pub"
}

variable "db01_subnet_prv" {
  description = "database 1 for api"
  #default     = "db01_subnet_prv"
}

variable "db02_subnet_prv" {
  description = "database 2 for api"
  #default     = "db02_subnet_prv"
}

variable "db03_subnet_prv" {
  description = "database 3 for api"
  #default     = "db03_subnet_prv"
}

#variable "public_subnet_ids" {
#  type    = "list"
#  #default = "lb01_subnet_pub,lb02_subnet_pub,lb03_subnet_pub"
#}

#variable "private_subnet_ids" {
#  type    = "list"
#  #default = "ecs01_subnet_prv,ecs02_subnet_prv,ecs03_subnet_prv,db01_subnet_prv,db02_subnet_prv,db03_subnet_prv,cd01_subnet_prv,cd02_subnet_prv,cd03_subnet_prv"
#}

variable "vpn_config" {
  description = "Configuration options for VPN"
  type        = map
}