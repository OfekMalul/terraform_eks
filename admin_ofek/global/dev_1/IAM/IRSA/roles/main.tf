# Created by: Ofek Malul
# Date: 22/2/2024
# Note: This will not work if the cluster is not up and running

data "aws_caller_identity" "current" {}

module "iam_eks_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"
  role_name = "AmazonEKSLoadBalancerControllerRole"
 
  cluster_service_accounts = {
    "terraform-eks-cluster" = ["kube-system:aws-load-balancer-controller"]
  }

   # !!! Change policy according to the arn policy created when doing terraform apply in the policies folder !!! #
  role_policy_arns = {
    policy = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AWSLoadBalancerControllerIAMPolicy"
  }
}

module "ebs_csi_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"
  role_name = "ebs-csi-terraform-eks-cluster"
 
  cluster_service_accounts = {
    "terraform-eks-cluster" = ["kube-system:ebs-csi-controller"]
  }

   # !!! Change policy according to the arn policy created when doing terraform apply in the policies folder !!! #
  role_policy_arns = {
    policy = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/EBSIAMPolicy"
  }
}
