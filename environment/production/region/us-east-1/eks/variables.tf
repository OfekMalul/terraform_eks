variable "tags" {
  description = "tags"
  type        = map
  default     = {
    Terraform   = "true"
    Environment = "production"
  }
}