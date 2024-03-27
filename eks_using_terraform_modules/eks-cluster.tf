# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "anshu049"
  cluster_version = "1.29"

  vpc_id                   = module.EKS-VPC.vpc_id
  subnet_ids               = module.EKS-VPC.public_subnets
  control_plane_subnet_ids = module.EKS-VPC.private_subnets

  cluster_endpoint_public_access = true

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


  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    test = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
    }
  }


  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true


  tags = {
    environment = "test"
    application = "load-test"
  }
}