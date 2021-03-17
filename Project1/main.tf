terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = "maranfe"
}

resource "aws_instance" "first_server" {
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu"
  }
}
