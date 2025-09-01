terraform {
  required_version = ">= 1.5"
  backend "remote" {
    organization = "your-tfc-org"
    workspaces {
      name = "infra-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source  = "./modules/compute"
  vpc_id  = module.network.vpc_id
  subnets = module.network.public_subnets
  alb_sg  = module.network.alb_sg
}

module "data_layer" {
  source      = "./modules/data-layer"
  vpc_id      = module.network.vpc_id
  db_username = var.db_username
  db_password = var.db_password
}