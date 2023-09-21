terraform {
  backend "s3" {
    bucket         = "statefileqtree" // update terraform remote state bucket name
    key            = "terraform.tfstate" 
    region         = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1" //update your keys
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "statefileqtree"     //update your unique bucket name          
  tags = {
    Name = "statefolder"
  }
}
resource "aws_s3_bucket_versioning" "example_bucket" {
  bucket = aws_s3_bucket.example_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example_bucket_lifecycle" {
  rule {
    id      = "example_rule"
    status  = "Enabled"
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
    expiration {
      days = 365
    }
  }
  bucket = aws_s3_bucket.example_bucket.bucket
  depends_on = [aws_s3_bucket.example_bucket]
}