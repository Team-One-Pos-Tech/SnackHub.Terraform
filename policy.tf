resource "aws_eks_access_policy_association" "eks_access_policy" {
  cluster_name  = aws_eks_cluster.snack_hub.name
  policy_arn    = var.policyArn
  principal_arn = "arn:aws:iam::${local.account_id}:role/${var.LabRoleName}"

  access_scope {
    type = "cluster"
  }
}