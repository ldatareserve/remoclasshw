terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1" 
}

resource "aws_instance" "this_example2" {
  ami                     = "ami-0d421d84814b7d51c"
  instance_type           = "t2.micro"
}

resource "aws_dynamodb_table" "another_example2" {
  name             = "example2"
  billing_mode = "PROVISIONED"
 read_capacity= "30"
 write_capacity= "30"
 attribute {
  name = "noteId"
  type = "S"
 }
 hash_key = "noteId"
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this_example2.id
} 

output "aws_dynamodb_table" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.another_example2.id
} 
