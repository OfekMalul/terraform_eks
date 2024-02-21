variable "tags" {
  description = "tags"
  type        = map
  default     = {
    Terraform   = "true"
    Environment = "production"
  }
}

variable "vpc_id" {
  description = "vpc id - please change if created new vpc"
  type = string
  default = "vpc-078a880954e723eaa"
}