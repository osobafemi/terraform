resource "aws_iam_role_policy" "awsec2_policy" {
  name = "awsec2_policy"
  role = "${aws_iam_role.terraform_ec2_role.id}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
policy = "${file("awsec2-policy.json")}" 
}

resource "aws_iam_role" "terraform_ec2_role" {
  name = "terraform_ec2_role"

  assume_role_policy = "${file("awsec2-assume-policy.json")}"
}

resource "aws_iam_instance_profile" "awsec2_profile" {
  name = "terraform_ec2_profile"
  role = aws_iam_role.terraform_ec2_role.name
}