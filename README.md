## Module VPC
Terraform will be used to provision AWS infrastructure and resources for Web:
- Customer Gateway
- Egress
- Elastic IP
- Internet Gateway
- Nat Gateway
- Route Tables
- Security Group
- Subnets
- VPC

```hcl
module "vpc" {
  source                   = "git::ssh://git@github.com:tonygyerr/terraform-aws-vpc.git"
  module_config            = var.module_config
  vpc_config               = var.vpc_config
  cidr                     = var.vpc_cidr
  azs                      = var.azs
  vpc_id                   = module.vpc.vpc_id
  vpn_config               = var.vpn_config
  region                   = var.aws_region
  environment              = var.environment
  application              = var.app_name
  enable_nat_gateway       = true
  single_nat_gateway       = true
  enable_vpn_gateway       = true
  enable_s3_endpoint       = true
  enable_dynamodb_endpoint = true
  private_db_subnet_ids    = module.vpc.private_db_subnets
  ecs01_subnet_pub         = var.ecs01_subnet_pub
  ecs02_subnet_pub         = var.ecs02_subnet_pub
  ecs03_subnet_pub         = var.ecs03_subnet_pub
  ecs01_subnet_prv         = var.ecs01_subnet_prv
  ecs02_subnet_prv         = var.ecs02_subnet_prv
  ecs03_subnet_prv         = var.ecs03_subnet_prv
  db01_subnet_prv          = var.db01_subnet_prv
  db02_subnet_prv          = var.db02_subnet_prv
  db03_subnet_prv          = var.db03_subnet_prv

  extra_tags = var.extra_tags
}
```

## Prerequisites
- Docker (for using Docker Image of dependencies)
- Git
- Terraform
- AWS Key pair for Terraform provisioning.
- AWS S3 bucket for remote terraform state file (tfstate)
- AWS Dynamo Database for tfstate table state lock 

## How to run this Module using Terraform Commands
```bash
cd examples
terraform get
terraform init -backend-config ../backend-config/dev.tfvars
terraform plan -var-file="../env-config/dev.tfvars"
terraform apply -var-file="../env-config/dev.tfvars" -auto-approve
terraform destroy -var-file="../env-config/dev.tfvars"
```

## How to Run this Module using Makefile Process
```bash
plz run //:plan_exe dev us-east-1
plz run //:apply_exe dev us-east-1
plz run //:destroy_exe dev us-east-1
```

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_tags | optional default tags | `map` | <pre>{<br>  "CostCenter": "N/A",<br>  "Name": "api",<br>  "Owner": "cloudops@energy.com",<br>  "env": "dev",<br>  "project": "app",<br>  "vpc": "api-east-vpc"<br>}</pre> | no |
| alb\_is\_internal | determines if the alb is internal or not | `string` | `"false"` | no |
| ami\_packer\_ecs\_ec2\_id | energy AMI built by Packer from Amazon AMI ECS Optimized | `map` | <pre>{<br>  "us-east-1": "ami-04351e12",<br>  "us-west-2": "ami-11120768"<br>}</pre> | no |
| amount\_private\_api\_subnets | n/a | `string` | `"3"` | no |
| amount\_private\_db\_subnets | n/a | `string` | `"3"` | no |
| amount\_private\_lb\_subnets | n/a | `string` | `"3"` | no |
| amount\_public\_api\_subnets | n/a | `string` | `"3"` | no |
| api\_flavor | ecs instance type | `string` | `"r3.large"` | no |
| api\_prv\_subnets | ecs private subnets for the vpc | `list` | <pre>[<br>  "",<br>  "",<br>  ""<br>]</pre> | no |
| api\_prv\_tags | n/a | `map` | <pre>{<br>  "Name": "api-ecs-prv-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "ecs"<br>}</pre> | no |
| api\_pub\_subnets | ecs public subnets for the vpc | `list` | <pre>[<br>  "",<br>  "",<br>  ""<br>]</pre> | no |
| api\_pub\_tags | n/a | `map` | <pre>{<br>  "Name": "api-ecs-pub-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "ecs"<br>}</pre> | no |
| api\_vpc\_flow\_log\_arn | api vpc flow log 'arn:aws:iam::123456789012:role/flowlogsRole' | `string` | `"arn:aws:iam::123456789012:role/flowlogsRole"` | no |
| application | n/a | `string` | n/a | yes |
| arcsight\_logsrc\_cidr | cidr for arcsight logsrc | `list` | <pre>[<br>  ""<br>]</pre> | no |
| availability\_zone | n/a | `string` | `"us-east-1a"` | no |
| availability\_zones | n/a | `string` | `"us-east-1a,us-east-1b,us-east-1d"` | no |
| aws | (Required) AWS credentials | `map` | <pre>{<br>  "az_count": 3,<br>  "region": "us-east-1"<br>}</pre> | no |
| aws\_account\_id | aws account id | `string` | `${key_users}` | no |
| aws\_key\_name | aws key name | `string` | `"terraform"` | no |
| aws\_region | ec2 region for the vpc | `string` | `"us-east-1"` | no |
| azs | n/a | `list` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1d"<br>]</pre> | no |
| base\_cidr | cidr for vpc | `string` | `""` | no |
| base\_cidr\_prv | cidr for vpc | `string` | `""` | no |
| base\_cidr\_pub | cidr for vpc | `string` | `""` | no |
| base\_private\_api\_cidr | cidr for vpc | `string` | `""` | no |
| bucket\_name | the name of the s3 bucket for terraform state file | `string` | `"app-terraform-state-non-prd"` | no |
| cgw\_id | (Optional) The ID of the VPN Customer Gateway to attach to this VPC | `string` | `"api-east-cgw"` | no |
| cidr | cidr for vpc | `string` | `""` | no |
| cidr\_ap | api vpc cidr for subnet | `string` | `""` | no |
| cidr\_prv | vpc cidr for subnet | `string` | `""` | no |
| cidr\_pub | vpc cidr for subnet | `string` | `""` | no |
| cloud\_ts\_cidr | cidr for cloud terminial server | `list` | <pre>[<br>  ""<br>]</pre> | no |
| container\_api\_config\_server | n/a | `string` | `"out-config-serv"` | no |
| container\_api\_cust\_list | n/a | `string` | `"out-customer-list"` | no |
| container\_api\_cust\_notification | n/a | `string` | `"out-cust-notif"` | no |
| container\_api\_email\_notification | n/a | `string` | `"out-email-notif"` | no |
| container\_api\_http\_client\_import\_preference | n/a | `string` | `"out-http-client-import-preference"` | no |
| container\_api\_log\_contact | n/a | `string` | `"out-log-contact"` | no |
| container\_api\_message\_controller | n/a | `string` | `"out-message-controller"` | no |
| container\_api\_process\_cust\_response | n/a | `string` | `"out-process-cust-response"` | no |
| container\_api\_text\_notification | n/a | `string` | `"out-text-notif"` | no |
| container\_api\_voice\_notification | n/a | `string` | `"out-voice-notif"` | no |
| container\_port | n/a | `string` | `"2368"` | no |
| container\_port\_api\_config\_server | n/a | `string` | `"2368"` | no |
| container\_port\_api\_cust\_list | n/a | `string` | `"2368"` | no |
| container\_port\_api\_cust\_notification | n/a | `string` | `"2368"` | no |
| container\_port\_api\_email\_notification | n/a | `string` | `"2368"` | no |
| container\_port\_api\_http\_client\_import\_preference | n/a | `string` | `"2368"` | no |
| container\_port\_api\_log\_contact | n/a | `string` | `"2368"` | no |
| container\_port\_api\_message\_controller | n/a | `string` | `"2368"` | no |
| container\_port\_api\_process\_cust\_response | n/a | `string` | `"2368e"` | no |
| container\_port\_api\_text\_notification | n/a | `string` | `"2368"` | no |
| container\_port\_api\_voice\_notification | n/a | `string` | `"2368"` | no |
| cost\_center | n/a | `string` | `"N/A"` | no |
| cpu | n/a | `string` | `"256"` | no |
| create\_monitoring\_role | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `bool` | `false` | no |
| create\_vpc | specify to create vpc | `string` | `"true"` | no |
| custdb\_port | n/a | `string` | `"3306"` | no |
| custdb\_tags | n/a | `map` | <pre>{<br>  "Name": "api-custdb-prv-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "sql"<br>}</pre> | no |
| db01\_prv\_subnet\_cidr | cidr for db01 aurora private subnet | `string` | `""` | no |
| db01\_subnet\_az | az for db01 private subnet | `string` | `"us-east-1a"` | no |
| db01\_subnet\_prv | database 1 for api | `any` | n/a | yes |
| db01\_subnet\_prv\_cidr | cidr for db 01 public subnet zone 1 | `string` | `""` | no |
| db02\_prv\_subnet\_cidr | cidr for db02 aurora private subnet | `string` | `""` | no |
| db02\_subnet\_az | az for db02 private subnet | `string` | `"us-east-1b"` | no |
| db02\_subnet\_prv | database 2 for api | `any` | n/a | yes |
| db02\_subnet\_prv\_cidr | cidr for db 02 public subnet zone 2 | `string` | `""` | no |
| db03\_prv\_subnet\_cidr | cidr for db03 aurora database private subnet | `string` | `""` | no |
| db03\_subnet\_az | az for db03 private subnet 5 | `string` | `"us-east-1d"` | no |
| db03\_subnet\_prv | database 3 for api | `any` | n/a | yes |
| db03\_subnet\_prv\_cidr | cidr for db 03 public subnet zone 3 | `string` | `""` | no |
| db\_prv\_subnets | database private subnets for the vpc | `list` | <pre>[<br>  "",<br>  "",<br>  ""<br>]</pre> | no |
| default\_vpc\_enable\_classiclink | specify to enable default vpc classic link | `string` | `"false"` | no |
| default\_vpc\_enable\_dns\_hostnames | specify to enable default vpc dns hostnames | `string` | `"false"` | no |
| default\_vpc\_enable\_dns\_support | specify to enable default vpc dns support | `string` | `"false"` | no |
| domain\_member\_cidr | cidr for domain member | `list` | <pre>[<br>  ""<br>]</pre> | no |
| ebs\_device\_name | device name for ebs | `string` | `"/dev/xvdcz"` | no |
| ebs\_vol\_az\_1a | az for ebs vol | `string` | `"us-east-1a"` | no |
| ebs\_vol\_az\_1b | az for ebs vol | `string` | `"us-east-1b"` | no |
| ebs\_vol\_az\_1d | az for ebs vol | `string` | `"us-east-1d"` | no |
| ebs\_vol\_name | name for ebs vol | `string` | `""` | no |
| ebs\_vol\_size | size for ebs vol | `string` | `"30"` | no |
| ebs\_vol\_size\_db | size for ebs vol | `string` | `"64"` | no |
| ebs\_vol\_type | volume type for ebs | `string` | `"gp2"` | no |
| ecr\_repositories | (Optional) list of ECR repositories to create for use with ECS | `list` | `[]` | no |
| ecs | (Required) map of variables for ECS | `map` | <pre>{<br>  "desired_capacity": 4,<br>  "health_check_grace_period": 300,<br>  "health_check_type": "EC2",<br>  "instance_type": "t2.micro",<br>  "max_size": 8,<br>  "min_size": 4<br>}</pre> | no |
| ecs01\_prv\_subnet\_cidr | cidr for ecs private subnet | `string` | `""` | no |
| ecs01\_pub\_subnet\_cidr | cidr for ecs public subnet | `string` | `""` | no |
| ecs01\_subnet\_az | az for the content delivery public subnet 1 | `string` | `"us-east-1a"` | no |
| ecs01\_subnet\_prv | n/a | `any` | n/a | yes |
| ecs01\_subnet\_prv\_cidr | cidr for ecs 01 private subnet zone 1 | `string` | `""` | no |
| ecs01\_subnet\_pub | n/a | `any` | n/a | yes |
| ecs01\_subnet\_pub\_cidr | cidr for ecs 01 public subnet zone 1 | `string` | `""` | no |
| ecs02\_prv\_subnet\_cidr | cidr for ecs private subnet | `string` | `""` | no |
| ecs02\_pub\_subnet\_cidr | cidr for ecs public subnet | `string` | `""` | no |
| ecs02\_subnet\_az | az for the content delivery public subnet 2 | `string` | `"us-east-1b"` | no |
| ecs02\_subnet\_prv | n/a | `any` | n/a | yes |
| ecs02\_subnet\_prv\_cidr | cidr for ecs 02 private subnet zone 2 | `string` | `""` | no |
| ecs02\_subnet\_pub | n/a | `any` | n/a | yes |
| ecs02\_subnet\_pub\_cidr | cidr for ecs 02 public subnet zone 2 | `string` | `""` | no |
| ecs03\_prv\_subnet\_cidr | cidr for ecs private subnet | `string` | `""` | no |
| ecs03\_pub\_subnet\_cidr | cidr for ecs public subnet | `string` | `""` | no |
| ecs03\_subnet\_az | az for the content delivery public subnet 3 | `string` | `"us-east-1d"` | no |
| ecs03\_subnet\_prv | n/a | `any` | n/a | yes |
| ecs03\_subnet\_prv\_cidr | cidr for ecs 03 private subnet zone 3 | `string` | `""` | no |
| ecs03\_subnet\_pub | n/a | `any` | n/a | yes |
| ecs03\_subnet\_pub\_cidr | cidr for ecs 03 public subnet zone 3 | `string` | `""` | no |
| emaildb\_port | n/a | `string` | `"3306"` | no |
| emaildb\_tags | n/a | `map` | <pre>{<br>  "Name": "api-emaildb-prv-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "sql"<br>}</pre> | no |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `false` | no |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| enable\_dynamodb\_endpoint | Should be true if you want to provision a DynamoDB endpoint to the VPC | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `true` | no |
| enable\_s3\_endpoint | Should be true if you want to provision an S3 endpoint to the VPC | `bool` | `false` | no |
| enable\_vpn\_gateway | Should be true if you want to create a new VPN Gateway resource and attach it to the VPC | `bool` | `false` | no |
| env | enviornment | `map` | <pre>{<br>  "dev": "dev",<br>  "prd": "prd",<br>  "qa": "qa",<br>  "stg": "stg",<br>  "test": "test"<br>}</pre> | no |
| environment | n/a | `string` | n/a | yes |
| epo\_cidr | cidr for cloud terminial server | `list` | <pre>[<br>  ""<br>]</pre> | no |
| external\_nat\_ip\_ids | List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse\_nat\_ips) | `list` | `[]` | no |
| extra\_tags | optional default tags | `map(string)` | `{}` | no |
| host\_port | n/a | `string` | `"8080"` | no |
| host\_port\_api\_config\_server | n/a | `string` | `"8080"` | no |
| host\_port\_api\_cust\_list | n/a | `string` | `"8080"` | no |
| host\_port\_api\_cust\_notification | n/a | `string` | `"8080"` | no |
| host\_port\_api\_email\_notification | n/a | `string` | `"8080"` | no |
| host\_port\_api\_http\_client\_import\_preference | n/a | `string` | `"8080"` | no |
| host\_port\_api\_log\_contact | n/a | `string` | `"8080"` | no |
| host\_port\_api\_message\_controller | n/a | `string` | `"8080"` | no |
| host\_port\_api\_process\_cust\_response | n/a | `string` | `"8080"` | no |
| host\_port\_api\_text\_notification | n/a | `string` | `"8080"` | no |
| host\_port\_api\_voice\_notification | n/a | `string` | `"8080"` | no |
| iam\_database\_authentication\_enabled | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | `bool` | `false` | no |
| image\_api\_config\_server | n/a | `string` | `"api-config-server"` | no |
| image\_api\_cust\_list | n/a | `string` | `"api-customer-list"` | no |
| image\_api\_cust\_notification | n/a | `string` | `"api-customer-notification"` | no |
| image\_api\_email\_notification | n/a | `string` | `"api-email-notification"` | no |
| image\_api\_http\_client\_import\_preference | n/a | `string` | `"api-http-client-import-preference"` | no |
| image\_api\_log\_contact | n/a | `string` | `"api-log-contact"` | no |
| image\_api\_message\_controller | n/a | `string` | `"api-message-controller"` | no |
| image\_api\_process\_cust\_response | n/a | `string` | `"api-process-customer-response"` | no |
| image\_api\_text\_notification | n/a | `string` | `"api-text-notification"` | no |
| image\_api\_voice\_notification | n/a | `string` | `"api-voice-notification"` | no |
| iops | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `0` | no |
| lb01\_prv\_subnet\_cidr | cidr for private service load balancer 01 | `string` | `""` | no |
| lb01\_subnet\_az | az for the content delivery public subnet 1 | `string` | `"us-east-1a"` | no |
| lb01\_subnet\_prv\_cidr | cidr for lb 01 public subnet zone 1 | `string` | `""` | no |
| lb02\_prv\_subnet\_cidr | cidr for private service load balancer 02 | `string` | `""` | no |
| lb02\_subnet\_az | az for the content delivery public subnet 2 | `string` | `"us-east-1b"` | no |
| lb02\_subnet\_prv\_cidr | cidr for lb 02 public subnet zone 2 | `string` | `""` | no |
| lb03\_prv\_subnet\_cidr | cidr for private service load balancer 03 | `string` | `""` | no |
| lb03\_subnet\_az | az for the content delivery public subnet 3 | `string` | `"us-east-1d"` | no |
| lb03\_subnet\_prv\_cidr | cidr for lb 03 public subnet zone 3 | `string` | `""` | no |
| lb\_prv\_subnets | load balancer private subnets for the vpc | `list` | <pre>[<br>  "",<br>  "",<br>  ""<br>]</pre> | no |
| lb\_tags | n/a | `map` | <pre>{<br>  "Name": "api-lb-pub-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "lb"<br>}</pre> | no |
| loc | region for the vpc | `map` | <pre>{<br>  "e": "awse1",<br>  "w": "awsw2"<br>}</pre> | no |
| manage\_default\_vpc | specify to manage default vpc | `string` | `"false"` | no |
| management | (Optional) The management VPC to peer with. | `map` | <pre>{<br>  "cidr": "",<br>  "route_table_id": "rtb-**********",<br>  "vpc_id": "vpc-04d4f17f"<br>}</pre> | no |
| map\_public\_ip\_on\_launch | Should be false if you do not want to auto-assign public IP on launch | `bool` | `true` | no |
| max\_subnets | Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument | `string` | `"12"` | no |
| max\_subnets\_prv | Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument | `string` | `"16"` | no |
| max\_subnets\_pub | Maximum number of subnets which can be created for CIDR blocks calculation. Default to length of `names` argument | `string` | `"32"` | no |
| memory | n/a | `string` | `"512"` | no |
| module\_config | Configuration options for the Module | `map` | n/a | yes |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| monitoring\_role\_arn | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring\_interval is non-zero. | `string` | `""` | no |
| monitoring\_role\_name | Name of the IAM role which will be created when create\_monitoring\_role is enabled. | `string` | `"rds-monitoring-role"` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| netnum | first number of subnet to start of (ex 10.1,10.2,10.3 subnet I specify 1) https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum\_ | `string` | `0` | no |
| netnum\_private\_api | n/a | `string` | `"6"` | no |
| netnum\_private\_db | n/a | `string` | `"9"` | no |
| netnum\_private\_lb | n/a | `string` | `"12"` | no |
| netnum\_public\_api | n/a | `string` | `"0"` | no |
| newbits | see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum\_ | `string` | `3` | no |
| newbits\_prv | see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum\_ | `string` | `2` | no |
| newbits\_pub | see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum\_ | `string` | `3` | no |
| num\_prv\_subnets | n/a | `string` | `"3"` | no |
| num\_pub\_subnets | n/a | `string` | `"3"` | no |
| num\_route\_tables | n/a | `string` | `"9"` | no |
| num\_subnets | n/a | `string` | `"9"` | no |
| number\_az | n/a | `string` | `"3"` | no |
| number\_nat\_gateways | n/a | `string` | `"1"` | no |
| number\_private\_rt | n/a | `string` | `"1"` | no |
| number\_public\_rt | n/a | `string` | `"1"` | no |
| number\_rt | n/a | `string` | `"3"` | no |
| number\_vpn\_rt\_propagation | n/a | `string` | `"1"` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`. | `bool` | `true` | no |
| open\_cidr | vpc cidr for subnet | `string` | `"0.0.0.0/0"` | no |
| owner | n/a | `string` | `"cloudops@energy.com"` | no |
| principal\_account\_id | map of root account numbers for logging | `map` | <pre>{<br>  "us-east-1": ${key_users},<br>  "us-east-2": ${key_users},<br>  "us-west-1": ${key_users},<br>  "us-west-2": ${key_users}<br>}</pre> | no |
| private\_db\_subnet\_ids | n/a | `list` | n/a | yes |
| private\_route\_table\_ids | private route tables for the vpc | `string` | `"ecs01_subnet_prv,ecs02_subnet_prv,ecs03_subnet_prv,ecs01_subnet_pub,ecs02_subnet_pub,ecs03_subnet_pub,db01_subnet_prv,db02_subnet_prv,db03_subnet_prv"` | no |
| private\_route\_tables | n/a | `list` | <pre>[<br>  "prv-db01",<br>  "prv-db02",<br>  "prv-db03",<br>  "prv-ecs01",<br>  "prv-ecs02",<br>  "prv-ecs03",<br>  "prv-lb01",<br>  "prv-lb02",<br>  "prv-lb03"<br>]</pre> | no |
| private\_subnet\_cidr | n/a | `list` | `[]` | no |
| private\_subnets | private subnets for the vpc | `list` | <pre>[<br>  "",<br>  "",<br>  "",<br>  "",<br>  "",<br>  ""<br>]</pre> | no |
| project | n/a | `string` | `"api"` | no |
| public\_eip\_ngw\_id | public eip for the nat gateway | `list` | <pre>[<br>  "api-east-eip-ngw"<br>]</pre> | no |
| public\_route\_table\_ids | public route tables for the vpc | `string` | `""` | no |
| public\_route\_tables | n/a | `list` | <pre>[<br>  "pub-ecs01",<br>  "pub-ecs02",<br>  "pub-ecs03"<br>]</pre> | no |
| public\_subnet\_cidr | n/a | `list` | `[]` | no |
| publicly\_accessible | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| rdp\_port | n/a | `string` | `"3389"` | no |
| region | n/a | `string` | n/a | yes |
| reuse\_nat\_ips | Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external\_nat\_ip\_ids' variable | `bool` | `false` | no |
| role | role of the subnets`api`, `lb`, `out` and `db` | `string` | `"out"` | no |
| route\_tables | n/a | `string` | `"prv-ecs01,prv-ecs02,prv-ecs03,pub-ecs01,pub-ecs02,pub-ecs03,prv-db01,prv-db02,prv-db03,prv-lb01"` | no |
| rt\_prv\_tags | n/a | `map` | <pre>{<br>  "Name": "api-prv-1-prv-rt",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "rt"<br>}</pre> | no |
| rt\_pub\_tags | n/a | `map` | <pre>{<br>  "Name": "api-pub-1-prv-rt",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "rt"<br>}</pre> | no |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
| sns\_topics | (Optional) list of SNS topics to create | `list` | `[]` | no |
| sqs\_queues | (Optional) list of SQS queues to create | `list` | `[]` | no |
| ssh\_port | n/a | `string` | `"22"` | no |
| storage\_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'. | `string` | `"gp2"` | no |
| tags | optional default tags | `map(string)` | `{}` | no |
| team | n/a | `list` | <pre>[<br>  "cloud"<br>]</pre> | no |
| textdb\_port | n/a | `string` | `"3306"` | no |
| textdb\_tags | n/a | `map` | <pre>{<br>  "Name": "api-textdb-prv-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "sql"<br>}</pre> | no |
| vgw\_ids | list of virtual gateways for propagation | `list` | `[]` | no |
| visibility | visibility of this subnet. valid values are `public` and `private` | `string` | `"private"` | no |
| voicedb\_port | n/a | `string` | `"3306"` | no |
| voicedb\_tags | n/a | `map` | <pre>{<br>  "Name": "api-voicedb-prv-1-subnet",<br>  "environment": "prd",<br>  "project": "api",<br>  "role": "sql"<br>}</pre> | no |
| vpc\_attach | specifies whether the vpg should be associated with a vpc | `string` | `"true"` | no |
| vpc\_cidr | cidr for vpc | `list` | <pre>[<br>  ""<br>]</pre> | no |
| vpc\_config | configuration option for vpc | `map(string)` | n/a | yes |
| vpc\_id | n/a | `string` | `"api-east-vpc"` | no |
| vpc\_ids | list of vpc ids | `list` | <pre>[<br>  "api-east-vpc"<br>]</pre> | no |
| vpc\_mngmt\_cidr | cidr for cloud terminial server | `list` | <pre>[<br>  ""<br>]</pre> | no |
| vpc\_security\_group\_ids | List of VPC security groups to associate | `list` | `[]` | no |
| vpn\_bgp\_asn | bpg autonomous system number (asn) of the customer gateway for a dynamically routed VPN connection. | `string` | `"65000"` | no |
| vpn\_config | Configuration options for VPN | `map` | n/a | yes |
| vpn\_dest\_cidr\_block | n/a | `string` | `""` | no |
| vpn\_id | n/a | `string` | `"api-east-vpn"` | no |
| vpn\_ip\_address | internet-routable ip address of the customer gateway's external interface. | `string` | `"172.0.0.7"` | no |
| vpn\_mngmt\_cgw\_id | management customer gateway id | `string` | `""` | no |
| wait\_for\_capacity\_timeout | n/a | `string` | `"10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| api\_security\_group\_id | n/a |
| db\_subnet\_group\_name | n/a |
| eip\_lb\_ngw\_id | n/a |
| igw\_id | n/a |
| private\_api\_subnets | n/a |
| private\_db\_subnets | n/a |
| private\_lb\_subnets | n/a |
| public\_api\_subnets | n/a |
| vpc\_id | n/a |