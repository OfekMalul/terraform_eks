terraform {
  backend "s3" {
    bucket = "ofek-malul-terraform-bucket"
    key    = "terraform/aws-iam-policies-terraform"
    region = "us-east-1"
  }
}