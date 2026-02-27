terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
 #   github = {
 #    source  = "integrations/github"    
#    }    
  }

  }
provider "github" {
  # Leave empty. It will grab the GITHUB_TOKEN from the environment.
    }
