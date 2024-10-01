
locals {
  name   = "snack-hub"
  region = "us-east-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  account_id   = data.aws_caller_identity.current.account_id
  lab_role_arn = "arn:aws:iam::${local.account_id}:role/${var.LabRoleName}"

  tags = {
    Example    = local.name
    GithubRepo = "https://github.com/Team-One-Pos-Tech/SnackHub"
    GithubOrg  = "https://github.com/Team-One-Pos-Tech"
  }
}

resource "aws_eks_cluster" "snack_hub" {
  name     = "${local.name}-cluster"
  role_arn = local.lab_role_arn
  version  = 1.31

  vpc_config {
    subnet_ids              = module.vpc.private_subnets
    endpoint_private_access = true
    endpoint_public_access  = true

  }

  access_config {
    authentication_mode = var.accessConfig
  }

  tags = local.tags
}