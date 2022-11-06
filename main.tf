terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

module "eks" {
  source = "./eks"
}

module "ecr" {
  source = "./ecr"
}