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
resource "aws_security_group" "security_demo" {
   name = "WS SG"
   description = "workid"

  ingress {
    from_port   = 8081
    protocol    = "tcp"
    to_port     = 8081
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]

  }
  
    ingress {
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
