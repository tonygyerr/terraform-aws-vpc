#--------------------------------------------------------------
# general
#--------------------------------------------------------------
environment = "dev"
application = "vpc"
owner       = "aws-trg"

#--------------------------------------------------------------
# vpc
#--------------------------------------------------------------
vpc_cidr = ["10.0.0.0/20"]
name     = "vpc"
azs      = ["us-east-1a", "us-east-1b"]
region   = "us-east-1"


extra_tags = {
  Owner       = "user"
  Environment = "dev"
  Name        = "vpc-iac"
  Region      = "us-east-1"
  Owner       = "app"
  CostCenter  = "app"
}

module_config = {
  profile       = "app"
  moduleVersion = "0.1.0"
}

vpc_config = {
  region              = "us-east-1"
  cidr                = "10.0.0.0/24" #"10.0.0.0/16"
  number_of_subnets   = "3"
  instance_tenancy    = "default"
  vpc_id              = ""
  subnets             = ""
  # public_ecs_subnets  = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
  # private_ecs_subnets = ["10.0.0.48/28", "10.0.0.64/28", "10.0.0.80/28"]
  # private_db_subnets  = ["10.0.0.96/28", "10.0.0.112/28", "10.0.0.128/28"]
  # private_lb_subnets  = ["10.0.0.144/28", "10.0.0.160/28", "10.0.0.176/28"]
}

vpn_config = {
  enabled              = false
  enabled_dns_resolver = false
}

tags = {
  Owner       = "cv-service"
  Environment = "dev"
  Name        = "cv-service-vpc-iac"
  Region      = "us-east-1"
  CostCenter  = "cv-service"
}

#--------------------------------------------------------------
# subnet_ids
#--------------------------------------------------------------
#private_db_subnet_ids   =   ""


#api01_subnet_pub        = ""
#api02_subnet_pub        = ""
#api03_subnet_pub        = ""
ecs01_subnet_pub = "10.0.0.0/28"
ecs02_subnet_pub = "10.0.0.16/28"
ecs03_subnet_pub = "10.0.0.32/28"

ecs01_subnet_prv = "10.0.0.48/28"
ecs02_subnet_prv = "10.0.0.64/28"
ecs03_subnet_prv = "10.0.0.80/28"

db01_subnet_prv = "10.0.0.96/28"
db02_subnet_prv = "10.0.0.112/28"
db03_subnet_prv = "10.0.0.128/28"

#lb01_subnet_prv         = "10.0.0.144/28"
#lb02_subnet_prv         = "10.0.0.160/28"
#lb03_subnet_prv         = "10.0.0.176/28"

