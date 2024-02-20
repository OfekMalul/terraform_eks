variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "eks_vpc"
}

variable "tags" {
  description = "tags"
  type        = map
  default     = {
    Terraform   = "true"
    Environment = "production"
  }
}