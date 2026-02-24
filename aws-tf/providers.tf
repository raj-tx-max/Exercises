terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    github = {
      source  = "integrations/github"
      
    }
  }
  backend "s3" {
    bucket = "1terraform-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
  }