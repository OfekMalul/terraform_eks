data "aws_vpc" "selected"{
    filter {
        name = "tag:Name"
        values = ["eks_vpc"]
    }
}

data "aws_subnets" "public_subnets"{
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.selected.id]
    }
}

output "public_sbunets_ids"{
    value = data.aws_subnets.public_subnets.ids
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

  vpc_id                   = data.aws_vpc.selected.id
  subnet_ids               = data.aws_subnets.public_subnets.ids
  control_plane_subnet_ids = data.aws_subnets.public_subnets.ids

  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
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