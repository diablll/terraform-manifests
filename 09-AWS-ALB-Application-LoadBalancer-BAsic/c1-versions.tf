#Terraform Block
terraform {
    required_version = "~> 0.14"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"

        }
        null = {
            source = "hashicorp/null"
            version = "~> 3.0.0"
    }    
    }
}
# Provider Block
provider = "aws" {
    region = "us-west-1"
}
resource "aws_instance" "myec2vm" {
    ami = "ami-009726b835c24a3aa"
    instance_type = "t2.medium"
    tags = {
        "Name" = "EC2 Demo"
    }
}