# Created by: Ofek Malul
# Date: 22/2/2024

resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  path        = "/"
  description = "Policy for the alb ingress controller"
  tags        = var.tags

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
    policy = file("./policy-alb-ingress-controller.json")
}


resource "aws_iam_policy" "EBSIAMPolicy" {
  name        = "EBSIAMPolicy"
  path        = "/"
  description = "Policy for the elb csi"
  tags        = var.tags

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
    policy = file("./policy-ebs.json")
}