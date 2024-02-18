terraform {
  backend "s3" {
    bucket = "ofek-malul-terraform-bucket"
    key    = "terraform/aws-vpc-terraform"
    region = "us-east-1"
  }
}