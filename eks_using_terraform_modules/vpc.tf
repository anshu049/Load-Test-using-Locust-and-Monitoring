# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

provider "aws" {
  region = "us-east-1"
}

variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
variable "public_subnet_cidr_blocks" {}

data "aws_availability_zones" "available" {}


module "EKS-VPC" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name            = "anshu049"
  cidr            = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks
  azs             = data.aws_availability_zones.available.names

  map_public_ip_on_launch = true
  enable_nat_gateway      = true
  single_nat_gateway      = true
  enable_dns_hostnames    = true

  tags = {
    "kubernetes.io/cluster/anshu049" = "shared" # EKS cluster name
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/anshu049" = "shared"
    "kubernetes.io/role/elb"         = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/anshu049"  = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

}