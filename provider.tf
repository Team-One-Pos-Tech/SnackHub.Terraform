terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.61"
    }
  }
}

provider "aws" {
  region = local.region
}