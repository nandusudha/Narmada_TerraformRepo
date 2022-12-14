terraform {
    required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
  secret_key = var.secret_key
  access_key = var.access_key
  
}

terraform {
  backend "s3" {
    region = "us-west-1"
  }   
}

    
  