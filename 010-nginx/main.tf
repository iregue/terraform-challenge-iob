resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_access_profile"
  role = aws_iam_role.s3_role.name
}

resource "aws_iam_role" "s3_role" {
  name = "s3_fullaccess_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"       
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_policy" {
  name = "s3fullaccess-policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_key_pair" "iregueiro" {
  key_name   = var.key_name
  public_key = var.public_key
}


resource "aws_instance" "nginx_instance" {
  ami                  = data.aws_ami.amazon-linux-2-ami.image_id
  instance_type        = var.nginx_instance_type
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name

  user_data_base64 = base64encode(local.instance-userdata)
  key_name         = aws_key_pair.iregueiro.key_name

  vpc_security_group_ids = [
    data.terraform_remote_state.sgs.outputs.ssh_securitygroup_output.sg_id,
    data.terraform_remote_state.sgs.outputs.nginx_securitygroup_output.sg_id
  ]

  tags = {
    Name    = "nginx-instance"
    Project = "iob-test"
  }

}
