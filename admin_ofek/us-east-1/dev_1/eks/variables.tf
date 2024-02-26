variable "tags" {
  description = "tags"
  type        = map
  default     = {
    Terraform   = "true"
    Environment = "dev-1"
  }
}

variable "vpc_id" {
  description = "vpc id - please change if created new vpc"
  type = string
  default = "vpc-0072509c4b4638b01"
}