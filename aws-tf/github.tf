terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = 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
}
# Create a new GitHub repository
resource "github_repository" "my_repo" {
    name        = "my-terraform-repo"
    description = "A repository created using Terraform"
    visibility  = "public"
}