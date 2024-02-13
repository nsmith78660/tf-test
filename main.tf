## PUT TERRAFORM CLOUD BLOCK HERE!  ##

terraform {
  cloud {
    organization = "procrastinate-organization"
    workspaces {
      name = "tf-cloud-test"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }



}


# Variable blocks directly within the main.tf. No arguments necessary.
variable "region" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  region     = "us-east-2"
}

# Add .gitignore file in this directory with the terraform.tfvars

resource "aws_instance" "tc_instance" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"

  tags = {
    Name = "TC-triggered-instance"
  }
}

resource "aws_iam_user" "test_user_99" {
  name = "test-user-99"
}