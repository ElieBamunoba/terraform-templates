terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_ssm_parameter" "test" {
  name  = "/dg/student/key/test/elie"
  type  = "String"
  value = "test1"
}
