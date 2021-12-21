resource "aws_security_group" "efs-sg" {
  name        = "${var.creation_token}-sg"
  description = "EFS PVs for EKS"
  vpc_id      = data.aws_eks_cluster.uat.vpc_config[0].vpc_id

  ingress {
    description     = "EKS Worker Nodes - NFS Mount for EFS"
    protocol        = "tcp"
    from_port       = 2049
    to_port         = 2049

    # Is this the security group of the cluster, to allow access? 
    security_groups = [var.cluster_security_group]
  }

  egress {
    protocol        = "-1"
    from_port       = 0
    to_port         = 0

    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.creation_token
    CreatedBy   = var.created_by
  }
}