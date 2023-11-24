terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "example" {
  bucket = "tfsec-bucket-00-00-00-00"
  acl    = "private"

     server_side_encryption_configuration {
     rule {
       apply_server_side_encryption_by_default {
         kms_master_key_id = "arn"
         sse_algorithm     = "aws:kms"
       }
     }
   }

     logging {
        target_bucket = "tfsec-bucket-00-00-00-00"
    }
    
    versioning {
        enabled = true
    }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = "tfsec-bucket-00-00-00-00"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
