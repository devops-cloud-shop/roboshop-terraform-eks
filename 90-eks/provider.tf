terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.28"
    }
  }

  backend "s3" {
    bucket = "daws86s-roboshop-infra-dev"
    key    = "roboshop-dev-eks"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}