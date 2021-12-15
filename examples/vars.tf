variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

variable "module_config" {
  description = "configuration option for Module"
  type        = map(string)
}

variable "public_subnets" {
  description = "private subnets for the vpc"
  type        = list
}

variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list
}

variable "db_prv_subnets" {
  description = "database private subnets for the vpc"
  type        = list
}

variable "vpc_name" {
  description = "name of the vpc"
  default     = ""
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

variable "environment" {
  type = string
}

variable "owner" {
  type    = string
  default = ""
}

variable "aws_region" {
  description = "ec2 region for the vpc"
  default     = ""
}

variable "create_vpc" {
  type        = string
  description = "specify to create vpc"
  default     = "true"
}

variable "vpn_config" {
  description = "Configuration options for VPN"
  type        = map
}

variable "deploy_env_map" {
  type = map
  default = {
    dev = "develop"
    test = "test"
    prod = "prod"
  }
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "max_session_duration" {
  type        = string
  description = "The maximum session duration"
  default     = "3600"
}

variable "assume_role_arns" {
  type        = list
  default     = []
}

variable "iam_name" {
  type        = string
  default     = ""
}

variable "iam_role" {
  type        = string
  default     = ""
}

variable "lambda_role_name" {
  type        = string
  default     = ""
}

variable "ssm_iam_instance_profile" {
  type        = string
  default     = ""
}

variable "ssm_iam_instance_role" {
  type        = string
  default     = ""
}

variable "ssm_actions" {
  type        = list
  default     = []
}

variable "vpn_ip_address" {
  type = string
  default = ""
  
}