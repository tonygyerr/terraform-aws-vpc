# bucket         = "terraform-state-dev-bucket"
bucket         = "terraform-statelock-dev-bucket"
key            = "dev/terraform/modules/vpc-terraform.tfstate"
dynamodb_table = "terraform-app-dev-statelock"
region         = "us-east-1"
profile        = "default"