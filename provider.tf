terraform {
  backend "s3" {
    bucket        = "my-terraform-s3-jenkins"  # S3 bucket for state file
    key           = "terraform.tfstate"        # State file path
    region        = "ap-south-1"
    encrypt       = true
    use_lockfile  = true  # Replaces 'dynamodb_table'
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
