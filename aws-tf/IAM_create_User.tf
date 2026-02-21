# -----------------------------
# Creating new IAM Group admin
# -----------------------------
#resource "aws_iam_group" "admin" {
#  name = "admin"
#}

# -----------------------------
# Checking if group already exists before creating new Group
# -----------------------------
data "aws_iam_group" "existing_admin" {
  group_name = "admin"
}

# -----------------------------
# Attach 'AdministratorAccess' policy to group
# -----------------------------
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = data.aws_iam_group.existing_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# -----------------------------
# create a IAM User called 'Salario' with Devops role 
# -----------------------------
resource "aws_iam_user" "newuser" {
  name = "Salario"
  path = "/system/"
  tags = {
    Role = "DevOps"
  }

# -----------------------------
# Add Salario to admin Group
# -----------------------------
#resource "aws_iam_group_membership" "team" {
#  name = "tf-testing-group-membership"
#  users = [
#    aws_iam_user.newuser.name,
#  ]
#  group = data.aws_iam_group.existing_admin.name
#}
#}
# --------------------------------------
# Tell your membership resource to look at the Data instead of the Resource.
# --------------------------------------
resource "aws_iam_user_group_membership" "team" {
  user   = aws_iam_user.newuser.name
  groups = [
    data.aws_iam_group.existing_admin.group_name
  ]
}