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

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod_subnet"
  }
}

resource "aws_instance" "first_server" {
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu"
  }
}
