module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.vpc_name
    cidr = "10.0.0.0/16"

    azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
    public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

    # automatic assigment of public ip to ec2 launch in the subnets
    map_public_ip_on_launch = true

    # Tags for all resources 
    tags = var.tags

    public_subnet_tags = var.pub_sub_tags
}