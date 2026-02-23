terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "1terraform-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
  }

provider "aws" {
  region = "us-east-1"
}
# ----------------------------------
# Creating fresh new IAM Group admin
# ----------------------------------
#resource "aws_iam_group" "admin" {
#  name = "admin"
#}

# ----------------------------------------------------------------
# Assuming IAM group already exists in aws,will use data resource
# ----------------------------------------------------------------
data "aws_iam_group" "existing_admin" {
  group_name = "admin"
}

# -----------------------------------------------
# Attach 'AdministratorAccess' policy to group
# -----------------------------------------------
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = data.aws_iam_group.existing_admin.group_name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# -----------------------------------------------------------------------------------------------
# create a IAM User called 'gh-tf' with Devops role especially for github actions for terraform 
# -----------------------------------------------------------------------------------------------
resource "aws_iam_user" "newuser" {
  name = "gh-tf2"
  path = "/system/"
  tags = {
    Role = "DevOps"
  }
}
# -----------------------------
# Add gh-tf to admin Group
# -----------------------------
#resource "aws_iam_group_membership" "team" {
#  name = "tf-testing-group-membership"
#  users = [
#    aws_iam_user.newuser.name,
#  ]
#  group = data.aws_iam_group.existing_admin.group_name
#}
#
# --------------------------------------
# Tell your membership resource to look at the Data instead of the Resource.
# --------------------------------------
resource "aws_iam_user_group_membership" "team" {
  user   = aws_iam_user.newuser.name
  groups = [
    data.aws_iam_group.existing_admin.group_name,
  ] 
  
}
