# terraform {
#   backend "s3" {
#     bucket = "dev-terraform-state"
#     key    = "vpc/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
terraform {

  backend "s3" {
    access_key = "AKIAZSIM5NOREOOWMKGO"
    secret_key = "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"
    bucket         = "sanju001-terraform-state"
    key            = "statefile/prod"
    region         = "us-east-1"
    dynamodb_table = "sanju-dynamodb-lock-state"
  }
}
