data "terraform_remote_state" "sgs" {
  backend = "s3"

  config = {
    bucket  = "iregueiro-terraform"
    key     = "terraform/sg.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}

data "terraform_remote_state" "nginx" {
  backend = "s3"

  config = {
    bucket  = "iregueiro-terraform"
    key     = "terraform/nginx.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}