variable "nodeName" {
  default = "ng-snack-hub"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
}

variable "LabRoleName" {
  default = "LabRole"
}