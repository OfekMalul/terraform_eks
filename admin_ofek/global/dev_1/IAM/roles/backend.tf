terraform {
  backend "s3" {
    bucket = "ofek-malul-terraform-bucket"
    key    = "terraform/aws-iam-roles-terraform"
    region = "us-east-1"
  }
}