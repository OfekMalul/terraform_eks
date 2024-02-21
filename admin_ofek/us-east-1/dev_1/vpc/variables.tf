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
    Environment = "dev-1"
  }
}

variable "pub_sub_tags" {
   description = "tags"
   type        = map
   default     = {
     "kubernetes.io/role/elb" = 1
  }
}