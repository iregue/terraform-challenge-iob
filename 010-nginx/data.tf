data "aws_ami" "amazon-linux-2-ami" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "terraform_remote_state" "sgs" {
  backend = "s3"

  config = {
    bucket  = "iregueiro-terraform"
    key     = "terraform/sg.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}