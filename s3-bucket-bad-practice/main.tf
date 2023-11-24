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
}
