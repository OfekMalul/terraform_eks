output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.iam_eks_role.iam_role_arn
}