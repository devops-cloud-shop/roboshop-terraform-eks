terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.23.0"
    }
  }
#backend configuration
  backend "s3" {
    bucket = "daws86s-roboshop-infra-dev"
    key    = "roboshop-dev-sg-rules-eks"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

#provider configuration
provider "aws" {
    region = "us-east-1"
}