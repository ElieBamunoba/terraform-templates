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

resource "aws_instance" "terraform-test" {
  ami           = "ami-0f58b397bc5c1f2e8" 
  tags = {
    Name = "elie-dg-ansible-control-tf"
  }
  instance_type = "t2.micro"
  key_name      = "elie"
  subnet_id     = "subnet-0e0f8c1f4debaac66" 
  associate_public_ip_address = true

  # Security group rules
  security_groups = ["sg-06b382513307ae528"]

  user_data = file("./userdata.sh")

  iam_instance_profile = "dg-ec2-base"
}

