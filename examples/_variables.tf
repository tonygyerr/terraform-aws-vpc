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
  default     = ""
}

variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list(string)
  default     = []
}

variable "vpc_name" {
  description = "name of the vpc"
  default     = ""
}

variable "vpc_default_name" {
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

variable "tags_default" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}

variable "environment" {
  type    = string
  default = ""
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "aws_region" {
  description = "ec2 region for the vpc"
  default     = ""
}

# variable "default_vpc" {
#   type    = string
#   default = "default-api"
# }

# variable "azs" {
#   type    = list(string)
#   default = ["us-east-1a", "us-east-1b", "us-east-1d"]
# }

variable "name" {
  description = "The domain name to setup DHCP for"
  default     = "api"
}

variable "domain_name" {
  description = "The internal DNS name to use with services"
  type        = string
  default     = ""
}

variable "domain_name_servers" {
  description = "A comma separated list of the IP addresses of internal DHCP servers"
  type        = string
  default     = ""
}

variable "public_subnets" {
  description = "public subnets for the vpc"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list(string)
  default     = []
}

variable "db_prv_subnets" {
  description = "database private subnets for the vpc"
  type        = list(string)
  default     = []
}

variable "elasticache_prv_subnets" {
  description = "load balancer private subnets for the vpc"
  type        = list(string)
  default     = []
}

variable "create_vpc" {
  type        = string
  description = "specify to create vpc"
  default     = "true"
}

variable "vpn_config" {
  description = "Configuration options for VPN"
  type        = map(any)
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "vpn_ip_address" {
  type    = string
  default = ""

}

variable "amount_private_db_subnets" {
  type    = string
  default = null
}

variable "amount_public_subnets" {
  type    = string
  default = null
}

variable "amount_private_subnets" {
  type    = string
  default = null
}

variable "amount_private_lb_subnets" {
  type    = string
  default = null
}