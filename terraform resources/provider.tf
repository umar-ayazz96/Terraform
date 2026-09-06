#Setting up the provider for AWS
terraform {
    
    required_providers {
    aws = {
      source  = "hashicorp/aws"
         }
    }
    required_version = ">= 1.0"

    
    backend "s3" {
    bucket = "unifin-prod-aws-statefile"
    key   = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
    }
}




#Setting up the AWS Region
provider "aws" {
        region = "ap-south-1"
}
