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
  region = "us-east-1" #/nand /n "eu-west-1" 
}

resource "aws_instance" "this_example" {
  ami                     = "ami-04e5276ebb8451442"
  instance_type           = "t2.micro"
}

resource "aws_dynamodb_table" "another_example" {
  name             = "example1"
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
  value       = aws_instance.this_example.id
} 

output "aws_dynamodb_table" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.another_example.id
} 
