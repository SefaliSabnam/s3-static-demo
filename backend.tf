terraform {
  backend "s3" {
    bucket         = "my-terraform-s3-jenkins"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
