resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.snack_hub.name
  node_group_name = var.nodeName
  node_role_arn   = local.lab_role_arn
  subnet_ids      = module.vpc.private_subnets
  disk_size       = 20
  instance_types  = ["t3.micro"]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_eks_cluster.snack_hub,
  ]
}