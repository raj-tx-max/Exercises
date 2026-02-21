# -----------------------------
# Creating new IAM Group admin
# -----------------------------
resource "aws_iam_group" "admin" {
  name = "admin"
}

# -----------------------------
# Attach 'AdministratorAccess' policy to group
# -----------------------------
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.admin.name
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
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"
  users = [
    aws_iam_user.newuser.name,
  ]
  group = aws_iam_group.admin.name
}
}
