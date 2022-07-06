terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = "AKIAQ6SMWPL6LYLKHDAE"
  secret_key = "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"
  region     = "us-east-1"
}

# Create a VPC
resource "aws_instance" "application" {
  ami			  = "ami-052efd3df9dad4825"
  instance_type  	  = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_demo.id]
  user_data              = file("init.sh")

  tags = {
  	Name = "application"
  }
}
