terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
terraform {

  backend "s3" {
    bucket = "bermtecterraformstate"
    region = "us-east-1"
  }
}
