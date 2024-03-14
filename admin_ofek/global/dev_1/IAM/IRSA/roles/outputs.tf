output "aws_loadbalancer_role_arn" {
  description = "ARN of IAM role"
  value       = module.iam_eks_role.iam_role_arn
}
output "ebs_csi_role_arn" {
  description = "ARN of IAM role"
  value       = module.ebs_csi_role.iam_role_arn
}