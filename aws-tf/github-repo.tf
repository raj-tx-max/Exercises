# This resource creates the actual git repository

resource "github_repository" "my_new_project" {
  name        = "tf-created-repo"
  description = "This repo was created automatically by Terraform"
  visibility = "public"

  # Initialize the repo with an empty README
  auto_init = true

}
