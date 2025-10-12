terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.99"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      Owner      = var.owner
      GithubRepo = var.repo_name
      GithubOrg  = var.org_name
    }
  }
}

# it would be nice if some of these below could be looked up, 
# but sadly this block doesn't support variables
# TODO replace bucket and kms_key_id below with your own values
terraform {
  backend "s3" {
    bucket         = "kates-s3-bucket"
    key            = "p2025-apprunner-6/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    kms_key_id     = "alias/kates_kms_alias"
    use_lockfile = true
  }
}
