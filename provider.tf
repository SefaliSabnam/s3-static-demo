terraform {
  backend "s3" {
    bucket         = "my-terraform-s3-jenkins"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    
  }
}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


provider "aws" {
  region = "ap-south-1"
}
