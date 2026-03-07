terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        # "6.16.0"
        version = "6.23.0" 
    }
     
  }

  backend "s3" {
    bucket = "daws86s-roboshop-infra-dev"
    key = "roboshop-dev-acm-eks"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}

provider "aws" {
    region = "us-east-1"
  
}