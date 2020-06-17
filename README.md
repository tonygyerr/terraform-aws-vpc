#--------------------------------------------------------------
# authors
#--------------------------------------------------------------

Module managed by Ekow Gyepi-Garbrah <ekow.gyepi-garbrah@accenture.com>

#--------------------------------------------------------------
# prerequisites
#--------------------------------------------------------------

- install git
- install terraform
- AWS Key pair for Terraform provisioning or as required per EC2 Instance requirements
- AWS s3 bucket for remote terraform state file (tfstate)
- AWS Dynamo dB for tfstate table state lock 

#--------------------------------------------------------------
# terraform
#--------------------------------------------------------------

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


```
$ cd terraform
$ terraform get
$ terraform fmt
$ terraform init -backend=true -var-file=env-config/dev.tfvars 
$ terraform validate -var-file=env-config/dev.tfvars 
$ terraform plan -var-file=env-config/dev.tfvars 
$ terraform apply -var-file=env-config/dev.tfvars 
$ terraform destroy -var-file=env-config/dev.tfvars 
```
#--------------------------------------------------------------
# inputs
#--------------------------------------------------------------

#--------------------------------------------------------------
# outputs
#--------------------------------------------------------------

