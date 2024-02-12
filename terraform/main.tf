terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
    profile = "brunofreitas-notebookVlab"
}


resource "aws_instance" "bia-dev" {
    ami= "ami-00a41344c1566fcc0"
    instance_type = "t2.micro"
    tags = {
        laboratorio = "2024"
        Name = "bia-dev"
    }
}
