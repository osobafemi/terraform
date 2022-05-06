
resource "aws_instance" "terraform_demo" {
    ami = var.ami
    instance_type = var.instance_type
    iam_instance_profile = "${aws_iam_instance_profile.awsec2_profile.name}"
    tags = {
        Name = "Sexiness"
        Env = "dev"
    }
}

