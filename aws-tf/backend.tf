  backend "s3" {
    bucket = "1terraform-state-bucket"
    key    = "example.terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
