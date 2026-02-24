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