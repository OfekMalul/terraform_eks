data "aws_subnets" "public_subnets"{
    filter {
        name = "vpc-id"
        values = [var.vpc_id]
    }
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "terraform-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = data.aws_subnets.public_subnets.ids
  control_plane_subnet_ids = data.aws_subnets.public_subnets.ids

  eks_managed_node_group_defaults = {
    instance_types = ["t3.large"]
    ami_type = "BOTTLEROCKET_x86_64" # using bottlerocket as it is speciflly made to host containers
  }

  eks_managed_node_groups = {
    eks_node_group = {
      min_size     = 1
      max_size     = 1
      desired_size = 1

      capacity_type  = "SPOT"
      tags = var.tags
    }
  }

  enable_cluster_creator_admin_permissions = true
  tags = var.tags
}