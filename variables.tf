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

variable "aws_key_name" {
  type        = string
  description = "aws key name"
  default     = "terraform"
}

variable "availability_zones" {
  type    = string
  default = "us-east-1a,us-east-1b,us-east-1d"
}

variable "azs" {
  type    = list
  default = ["us-east-1a", "us-east-1b", "us-east-1d"]
}

variable "loc" {
  type        = map
  description = "region for the vpc"

  default = {
    e = "awse1"
    w = "awsw2"
  }
}

variable "aws_region" {
  description = "ec2 region for the vpc"
  default     = "us-east-1"
}

variable "ebs_vol_name" {
  description = "name for ebs vol"
  default     = ""
}

variable "ebs_vol_az_1a" {
  description = "az for ebs vol"
  default     = "us-east-1a"
}

variable "ebs_vol_az_1b" {
  description = "az for ebs vol"
  default     = "us-east-1b"
}

variable "ebs_vol_az_1d" {
  description = "az for ebs vol"
  default     = "us-east-1d"
}

variable "ebs_vol_size" {
  description = "size for ebs vol"
  default     = "30"
}

variable "ebs_vol_size_db" {
  description = "size for ebs vol"
  default     = "64"
}

variable "ebs_vol_type" {
  description = "volume type for ebs"
  default     = "gp2"
}

variable "ebs_device_name" {
  description = "device name for ebs"
  default     = "/dev/xvdcz"
}

variable "vpc_id" {
  default = "api-east-vpc"
}

variable "management" {
  description = "(Optional) The management VPC to peer with."
  type        = map

  default = {
    vpc_id         = "vpc-04d4f17f"
    cidr           = ""
    route_table_id = "rtb-**********"
  }
}

variable "vpc_ids" {
  description = "list of vpc ids"
  type        = list
  default     = ["api-east-vpc"]
}

variable "vpn_id" {
  default = "api-east-vpn"
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

variable "private_route_table_ids" {
  description = "private route tables for the vpc"
  type        = string
  default     = "ecs01_subnet_prv,ecs02_subnet_prv,ecs03_subnet_prv,ecs01_subnet_pub,ecs02_subnet_pub,ecs03_subnet_pub,db01_subnet_prv,db02_subnet_prv,db03_subnet_prv"
}

variable "public_route_table_ids" {
  description = "public route tables for the vpc"
  type        = string
  default     = ""
}

variable "public_eip_ngw_id" {
  description = "public eip for the nat gateway"
  type        = list
  default     = ["api-east-eip-ngw"]
}

variable "vpn_dest_cidr_block" {
  type    = string
  default = ""
}

variable "cidr" {
  description = "cidr for vpc"
  type        = string
  default     = ""
}

variable "base_cidr" {
  description = "cidr for vpc" #this variable is utilized in the locals.tf
  type        = string
  default     = ""
}

variable "base_cidr_pub" {
  description = "cidr for vpc"
  type        = string
  default     = ""
}

variable "base_cidr_prv" {
  description = "cidr for vpc"
  type        = string
  default     = ""
}

variable "base_private_api_cidr" {
  description = "cidr for vpc"
  type        = string
  default     = ""
}

variable "cloud_ts_cidr" {
  description = "cidr for cloud terminial server"
  type        = list
  default     = [""]
}

variable "vpc_mngmt_cidr" {
  description = "cidr for cloud terminial server"
  type        = list
  default     = [""]
}

variable "api_pub_subnets" {
  description = "ecs public subnets for the vpc"
  type        = list
  default     = []
}

variable "api_prv_subnets" {
  description = "ecs private subnets for the vpc"
  type        = list
  default     = []
}

variable "db_prv_subnets" {
  description = "database private subnets for the vpc"
  type        = list
  default     = []
}

variable "lb_prv_subnets" {
  description = "load balancer private subnets for the vpc"
  type        = list
  default     = []
}

variable "vpn_mngmt_cgw_id" {
  description = "management customer gateway id"
  type        = string
  default     = ""
}

variable "arcsight_logsrc_cidr" {
  description = "cidr for arcsight logsrc"
  type        = list
  default     = [""]
}

variable "domain_member_cidr" {
  description = "cidr for domain member"
  type        = list
  default     = [""]
}

variable "epo_cidr" {
  description = "cidr for cloud terminial server"
  type        = list
  default     = [""]
}

variable "ecs01_subnet_pub_cidr" {
  description = "cidr for ecs 01 public subnet zone 1"
  type        = string
  default     = ""
}

variable "ecs02_subnet_pub_cidr" {
  description = "cidr for ecs 02 public subnet zone 2"
  type        = string
  default     = ""
}

variable "ecs03_subnet_pub_cidr" {
  description = "cidr for ecs 03 public subnet zone 3"
  type        = string
  default     = ""
}

variable "ecs01_subnet_prv_cidr" {
  description = "cidr for ecs 01 private subnet zone 1"
  type        = string
  default     = ""
}

variable "ecs02_subnet_prv_cidr" {
  description = "cidr for ecs 02 private subnet zone 2"
  type        = string
  default     = ""
}

variable "ecs03_subnet_prv_cidr" {
  description = "cidr for ecs 03 private subnet zone 3"
  type        = string
  default     = ""
}

variable "db01_subnet_prv_cidr" {
  description = "cidr for db 01 public subnet zone 1"
  type        = string
  default     = ""
}

variable "db02_subnet_prv_cidr" {
  description = "cidr for db 02 public subnet zone 2"
  type        = string
  default     = ""
}

variable "db03_subnet_prv_cidr" {
  description = "cidr for db 03 public subnet zone 3"
  type        = string
  default     = ""
}

variable "lb01_subnet_prv_cidr" {
  description = "cidr for lb 01 public subnet zone 1"
  type        = string
  default     = ""
}

variable "lb02_subnet_prv_cidr" {
  description = "cidr for lb 02 public subnet zone 2"
  type        = string
  default     = ""
}

variable "lb03_subnet_prv_cidr" {
  description = "cidr for lb 03 public subnet zone 3"
  type        = string
  default     = ""
}

variable "custdb_port" {
  type    = string
  default = "3306"
}

variable "emaildb_port" {
  type    = string
  default = "3306"
}

variable "textdb_port" {
  type    = string
  default = "3306"
}

variable "voicedb_port" {
  type    = string
  default = "3306"
}

variable "rdp_port" {
  type    = string
  default = "3389"
}

variable "ssh_port" {
  type    = string
  default = "22"
}

variable "private_db_subnet_ids" {
  type    = list
  default = []
}

variable "lb01_prv_subnet_cidr" {
  description = "cidr for private service load balancer 01"
  type        = string
  default     = ""
}

variable "lb02_prv_subnet_cidr" {
  description = "cidr for private service load balancer 02"
  type        = string
  default     = ""
}

variable "lb03_prv_subnet_cidr" {
  description = "cidr for private service load balancer 03"
  type        = string
  default     = ""
}

variable "ecs01_subnet_az" {
  description = "az for the content delivery public subnet 1"
  default     = "us-east-1a"
}

variable "ecs02_subnet_az" {
  description = "az for the content delivery public subnet 2"
  default     = "us-east-1b"
}

variable "ecs03_subnet_az" {
  description = "az for the content delivery public subnet 3"
  default     = "us-east-1d"
}

variable "db01_subnet_az" {
  description = "az for db01 private subnet"
  default     = "us-east-1a"
}

variable "db02_subnet_az" {
  description = "az for db02 private subnet"
  default     = "us-east-1b"
}

variable "db03_subnet_az" {
  description = "az for db03 private subnet 5"
  default     = "us-east-1d"
}

variable "lb01_subnet_az" {
  description = "az for the content delivery public subnet 1"
  default     = "us-east-1a"
}

variable "lb02_subnet_az" {
  description = "az for the content delivery public subnet 2"
  default     = "us-east-1b"
}

variable "lb03_subnet_az" {
  description = "az for the content delivery public subnet 3"
  default     = "us-east-1d"
}

variable "ecr_repositories" {
  description = "(Optional) list of ECR repositories to create for use with ECS"
  type        = list
  default     = []
}

variable "ecs" {
  description = "(Required) map of variables for ECS"
  type        = map

  default = {
    //instance_type    = "c4.large"
    instance_type             = "t2.micro"
    min_size                  = 4
    max_size                  = 8
    desired_capacity          = 4
    health_check_type         = "EC2"
    health_check_grace_period = 300
  }
}

variable "api_flavor" {
  description = "ecs instance type"
  default     = "r3.large"
}

variable "number_az" {
  type    = string
  default = "3"
}

variable "number_nat_gateways" {
  type    = string
  default = "1"
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

variable "private_route_tables" {
  type    = list
  default = ["prv-db01", "prv-db02", "prv-db03", "prv-ecs01", "prv-ecs02", "prv-ecs03", "prv-lb01", "prv-lb02", "prv-lb03"]
}

variable "public_route_tables" {
  type    = list
  default = ["pub-ecs01", "pub-ecs02", "pub-ecs03"]
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

variable "aabg_tags" {
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

variable "amount_public_api_subnets" {
  type    = string
  default = "3"
}

variable "amount_private_api_subnets" {
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

variable "api_pub_tags" {
  type = map

  default = {
    "Name"        = "api-ecs-pub-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "ecs"
  }
}

variable "api_prv_tags" {
  type = map

  default = {
    "Name"        = "api-ecs-prv-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "ecs"
  }
}

variable "lb_tags" {
  type = map

  default = {
    "Name"        = "api-lb-pub-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "lb"
  }
}

variable "custdb_tags" {
  type = map

  default = {
    "Name"        = "api-custdb-prv-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "sql"
  }
}

variable "emaildb_tags" {
  type = map

  default = {
    "Name"        = "api-emaildb-prv-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "sql"
  }
}

variable "textdb_tags" {
  type = map

  default = {
    "Name"        = "api-textdb-prv-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "sql"
  }
}

variable "voicedb_tags" {
  type = map

  default = {
    "Name"        = "api-voicedb-prv-1-subnet"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "sql"
  }
}

variable "rt_prv_tags" {
  type = map

  default = {
    "Name"        = "api-prv-1-prv-rt"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "rt"
  }
}

variable "rt_pub_tags" {
  type = map

  default = {
    "Name"        = "api-pub-1-prv-rt"
    "environment" = "prd"
    "project"     = "api"
    "role"        = "rt"
  }
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

variable "wait_for_capacity_timeout" {
  type    = string
  default = "10m"
}

variable "api_vpc_flow_log_arn" {
  description = "api vpc flow log 'arn:aws:iam::123456789012:role/flowlogsRole'"
  type        = string
  default     = "arn:aws:iam::123456789012:role/flowlogsRole"
}

variable "image_api_cust_list" {
  type    = string
  default = "api-customer-list"
}

variable "image_api_config_server" {
  type    = string
  default = "api-config-server"
}

variable "image_api_cust_notification" {
  type    = string
  default = "api-customer-notification"
}

variable "image_api_email_notification" {
  type    = string
  default = "api-email-notification"
}

variable "image_api_http_client_import_preference" {
  type    = string
  default = "api-http-client-import-preference"
}

variable "image_api_log_contact" {
  type    = string
  default = "api-log-contact"
}

variable "image_api_message_controller" {
  type    = string
  default = "api-message-controller"
}

variable "image_api_process_cust_response" {
  type    = string
  default = "api-process-customer-response"
}

variable "image_api_text_notification" {
  type    = string
  default = "api-text-notification"
}

variable "image_api_voice_notification" {
  type    = string
  default = "api-voice-notification"
}

variable "container_api_cust_list" {
  type    = string
  default = "out-customer-list"
}

variable "container_api_config_server" {
  type    = string
  default = "out-config-serv"
}

variable "container_api_cust_notification" {
  type    = string
  default = "out-cust-notif"
}

variable "container_api_email_notification" {
  type    = string
  default = "out-email-notif"
}

variable "container_api_http_client_import_preference" {
  type    = string
  default = "out-http-client-import-preference"
}

variable "container_api_log_contact" {
  type    = string
  default = "out-log-contact"
}

variable "container_api_message_controller" {
  type    = string
  default = "out-message-controller"
}

variable "container_api_process_cust_response" {
  type    = string
  default = "out-process-cust-response"
}

variable "container_api_text_notification" {
  type    = string
  default = "out-text-notif"
}

variable "container_api_voice_notification" {
  type    = string
  default = "out-voice-notif"
}

variable "host_port" {
  type    = string
  default = "8080"
}

variable "host_port_api_cust_list" {
  type    = string
  default = "8080"
}

variable "host_port_api_config_server" {
  type    = string
  default = "8080"
}

variable "host_port_api_cust_notification" {
  type    = string
  default = "8080"
}

variable "host_port_api_email_notification" {
  type    = string
  default = "8080"
}

variable "host_port_api_http_client_import_preference" {
  type    = string
  default = "8080"
}

variable "host_port_api_log_contact" {
  type    = string
  default = "8080"
}

variable "host_port_api_message_controller" {
  type    = string
  default = "8080"
}

variable "host_port_api_process_cust_response" {
  type    = string
  default = "8080"
}

variable "host_port_api_text_notification" {
  type    = string
  default = "8080"
}

variable "host_port_api_voice_notification" {
  type    = string
  default = "8080"
}

variable "container_port" {
  type    = string
  default = "2368"
}

variable "container_port_api_cust_list" {
  type    = string
  default = "2368"
}

variable "container_port_api_config_server" {
  type    = string
  default = "2368"
}

variable "container_port_api_cust_notification" {
  type    = string
  default = "2368"
}

variable "container_port_api_email_notification" {
  type    = string
  default = "2368"
}

variable "container_port_api_http_client_import_preference" {
  type    = string
  default = "2368"
}

variable "container_port_api_log_contact" {
  type    = string
  default = "2368"
}

variable "container_port_api_message_controller" {
  type    = string
  default = "2368"
}

variable "container_port_api_process_cust_response" {
  type    = string
  default = "2368e"
}

variable "container_port_api_text_notification" {
  type    = string
  default = "2368"
}

variable "cpu" {
  type    = string
  default = "256"
}

variable "memory" {
  type    = string
  default = "512"
}

variable "container_port_api_voice_notification" {
  type    = string
  default = "2368"
}
variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "cidr for vpc"
  type        = list
  default     = [""]
}

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


/*
variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  default     = ""
}
*/

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

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = "gp2"
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
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


variable "private_subnets" {
  description = "private subnets for the vpc"
  type        = list
  default     = []
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

variable "ecs01_pub_subnet_cidr" {
  description = "cidr for ecs public subnet"
  type        = string
  default     = ""
}

variable "ecs02_pub_subnet_cidr" {
  description = "cidr for ecs public subnet"
  type        = string
  default     = ""
}

variable "ecs03_pub_subnet_cidr" {
  description = "cidr for ecs public subnet"
  type        = string
  default     = ""
}

variable "ecs01_prv_subnet_cidr" {
  description = "cidr for ecs private subnet"
  type        = string
  default     = ""
}

variable "ecs02_prv_subnet_cidr" {
  description = "cidr for ecs private subnet"
  type        = string
  default     = ""
}

variable "ecs03_prv_subnet_cidr" {
  description = "cidr for ecs private subnet"
  type        = string
  default     = ""
}

variable "db01_prv_subnet_cidr" {
  description = "cidr for db01 aurora private subnet"
  type        = string
  default     = ""
}

variable "db02_prv_subnet_cidr" {
  description = "cidr for db02 aurora private subnet"
  type        = string
  default     = ""
}

variable "db03_prv_subnet_cidr" {
  description = "cidr for db03 aurora database private subnet"
  type        = string
  default     = ""
}

variable "db_subnet_group_name" {
  description = "The name of the Database Subnet Group name"
  type        = string
  default     = ""
}


variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}
