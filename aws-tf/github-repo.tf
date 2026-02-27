# This resource creates the actual repository

resource "github_repository" "my_new_project" {
  name        = "tf-created-repo"
  description = "This repo was created automatically by Terraform"

  # Options: "public" or "private"
  visibility = "public"

  # Initialize the repo with an empty README
  auto_init = true
}

# Output the URL so you can find it easily in your GitHub Action logs
output "repo_url" {
  value       = github_repository.my_new_project.html_url
  description = "The URL of the newly created repository"
}
