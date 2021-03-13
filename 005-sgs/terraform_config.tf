provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "iregueiro-terraform"
    region  = "eu-west-1"
    key     = "terraform/sg.tfstate"
  }
}

