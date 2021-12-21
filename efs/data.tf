
data "aws_kms_alias" "efs_kms" {
  name = var.kms_alias
}

data "aws_eks_cluster" "uat" {
  name = var.eks_cluster
}

data "aws_subnet_ids" "private_aws_subnet_ids" {
  vpc_id = var.vpc_id

  # Get all the subnets with the tag of Zone: Private
  tags = {
    Zone = "Private"
  }
}