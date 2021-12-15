variable "aws" {
  description = "(Required) AWS credentials"
  type        = map

  default = {
    region   = "us-east-1"
    az_count = 3
  }
}

variable "aws_account_id" {
  type        = string
  description = "aws account id"
  default     = ""
}

variable "principal_account_id" {
  type        = map
  description = "map of root account numbers for logging"

  default = {
    us-east-1 = ""
    us-east-2 = ""
    us-west-1 = ""
    us-west-2 = ""
  }
}

variable "availability_zones" {
  type    = string
  default = "us-east-1a,us-east-1b,us-east-1d"
}


variable "aws_region" {
  description = "ec2 region for the vpc"
  default     = ""
}

variable "module_config" {
  description = "Configuration options for the Module"
  type        = map
}

variable "vpn_config" {
  description = "Configuration options for VPN"
  type        = map
}

variable "vpc_attach" {
  type        = string
  description = "specifies whether the vpg should be associated with a vpc"
  default     = "true"
}

variable "cgw_id" {
  type        = string
  description = "(Optional) The ID of the VPN Customer Gateway to attach to this VPC"
  default     = "api-east-cgw"
}

variable "vpn_bgp_asn" {
  description = "bpg autonomous system number (asn) of the customer gateway for a dynamically routed VPN connection."
  type        = string
  default     = "65000"
}

variable "vpn_ip_address" {
  description = "internet-routable ip address of the customer gateway's external interface."
  default     = ""
}

variable "cidr" {
  description = "cidr for vpc"
  type        = string
  default     = ""
}

variable "public_subnets" {
  description = "public subnets for the vpc"
  type        = list
  default     = []
}

variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list
  default     = []
}

variable "db_prv_subnets" {
  description = "database private subnets for the vpc"
  type        = list
  default     = []
}

# variable "lb_prv_subnets" {
#   description = "load balancer private subnets for the vpc"
#   type        = list
#   default     = []
# }

# variable "private_db_subnet_ids" {
#   type    = list
#   default = []
# }

variable "ecs" {
  description = "(Required) map of variables for ECS"
  type        = map

  default = {
    instance_type             = "t2.micro"
    min_size                  = 4
    max_size                  = 8
    desired_capacity          = 4
    health_check_type         = "EC2"
    health_check_grace_period = 300
  }
}

variable "number_az" {
  type    = string
  default = "3"
}

variable "number_private_rt" {
  type    = string
  default = "1"
}

variable "number_public_rt" {
  type    = string
  default = "1"
}

variable "number_rt" {
  type    = string
  default = "3"
}

variable "number_vpn_rt_propagation" {
  type    = string
  default = "1"
}

variable "vgw_ids" {
  type        = list
  description = "list of virtual gateways for propagation"
  default     = []
}

variable "team" {
  type    = list
  default = ["cloud"]
}

variable "tags" {
  type        = map
  description = "optional default tags"

  default = {
    Name       = "api"
    Owner      = "cloudops@energy.com"
    CostCenter = "N/A"
    vpc        = "api-east-vpc"
    env        = "dev"
    project    = "app"
  }
}


variable "project" {
  type    = string
  default = "api"
}

variable "alb_is_internal" {
  description = "determines if the alb is internal or not"
  default     = "false"
}

variable "bucket_name" {
  description = "the name of the s3 bucket for terraform state file"
  default     = "app-terraform-state-non-prd"
}

variable "sqs_queues" {
  description = "(Optional) list of SQS queues to create"
  type        = list
  default     = []
}

variable "sns_topics" {
  description = "(Optional) list of SNS topics to create"
  type        = list
  default     = []
}

variable "role" {
  description = "role of the subnets`api`, `lb`, `out` and `db` "
  type        = string
  default     = "out"
}

variable "netnum_public_api" {
  type    = string
  default = "0"
}

variable "netnum_private_api" {
  type    = string
  default = "6"
}

variable "netnum_private_db" {
  type    = string
  default = "9"
}

variable "netnum_private_lb" {
  type    = string
  default = "12"
}

variable "amount_private_db_subnets" {
  type    = string
  default = "3"
}

variable "amount_public_subnets" {
  type    = string
  default = "3"
}

variable "amount_private_subnets" {
  type    = string
  default = "3"
}

variable "amount_private_lb_subnets" {
  type    = string
  default = "3"
}

variable "newbits" {
  description = "see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum_"
  type        = string
  default     = 3
}

variable "newbits_pub" {
  description = "see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum_"
  type        = string
  default     = 3
}

variable "newbits_prv" {
  description = "see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum_"
  type        = string
  default     = 2
}

variable "netnum" {
  description = "first number of subnet to start of (ex 10.1,10.2,10.3 subnet I specify 1) https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum_"
  type        = string
  default     = 0
}

variable "max_subnets" {
  description = "Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument"
  default     = "12"
}

variable "max_subnets_pub" {
  description = "Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument"
  default     = "32"
}

variable "max_subnets_prv" {
  description = "Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument"
  default     = "16"
}

variable "visibility" {
  description = "visibility of this subnet. valid values are `public` and `private`"
  default     = "private"
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "region" {
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

variable "env" {
  type        = map
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

variable "num_pub_subnets" {
  type    = string
  default = "3"
}

variable "num_prv_subnets" {
  type    = string
  default = "3"
}

variable "num_subnets" {
  type    = string
  default = "9"
}

variable "route_tables" {
  type    = string
  default = "prv-ecs01,prv-ecs02,prv-ecs03,pub-ecs01,pub-ecs02,pub-ecs03,prv-db01,prv-db02,prv-db03,prv-lb01"
}

variable "num_route_tables" {
  type    = string
  default = "9"
}

variable "extra_tags" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}

variable "wait_for_capacity_timeout" {
  type    = string
  default = "10m"
}

variable "vpc_flow_log_arn" {
  description = "api vpc flow log 'arn:aws:iam::123456789012:role/flowlogsRole'"
  type        = string
  default     = "arn:aws:iam::123456789012:role/flowlogsRole"
}

variable "cpu" {
  type    = string
  default = "256"
}

variable "memory" {
  type    = string
  default = "512"
}

variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

# variable "vpc_config" {
#   description = "configuration option for vpc"
#   type        = list
#   default     = [""]
# }

variable "public_subnet_cidr" {
  type    = list
  default = []
}

variable "private_subnet_cidr" {
  type    = list
  default = []
}

variable "create_vpc" {
  type        = string
  description = "specify to create vpc"
  default     = "true"
}

variable "manage_default_vpc" {
  type        = string
  description = "specify to manage default vpc"
  default     = "false"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  default     = 0
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  default     = false
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  default     = ""
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  default     = "rds-monitoring-role"
}

variable "create_monitoring_role" {
  description = "Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = true
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list
  default     = []
}

variable "enable_dynamodb_endpoint" {
  description = "Should be true if you want to provision a DynamoDB endpoint to the VPC"
  default     = false
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "open_cidr" {
  description = "vpc cidr for subnet"
  type        = string
  default     = "0.0.0.0/0"
}

variable "cidr_pub" {
  description = "vpc cidr for subnet"
  type        = string
  default     = ""
}

variable "cidr_prv" {
  description = "vpc cidr for subnet"
  type        = string
  default     = ""
}

variable "cidr_ap" {
  description = "api vpc cidr for subnet"
  type        = string
  default     = ""
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}
