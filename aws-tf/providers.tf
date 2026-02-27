terraform {
  required_providers {
    github = { 
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
provider "github" {
 owner = "raj-tx-max"
  # Reads GITHUB_TOKEN from environment
}
  

