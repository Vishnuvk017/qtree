provider "aws" {
  region = "us-east-1" //update your keys
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "statefileqtreeererere"     //update your unique bucket name          
  tags = {
    Name = "statefolder"
  }
}
