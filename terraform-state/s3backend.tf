provider "aws" {
  region  = "us-east-1"
  profile = "aws-sanjeev"
}

resource "aws_s3_bucket" "sanju-s3-bucket" {
  bucket = "sanju001-terraform-state"
  
 
  tags = {
    Name        = "sanju001-terraform-state"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_acl" "sanju-s3-bucket-acl" {
  bucket = aws_s3_bucket.sanju-s3-bucket.id
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "sanju-dynamodb-lock-state"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}