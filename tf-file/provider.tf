terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {
    bucket  = "ani-project-terraform-bucket-2025"  # S3 bucket name
    # key     = "state-files/${terraform.workspace}/terraform.tfstate" # Path to state file
    # region  = "us-east-1"                          # Bucket region
    # encrypt = true 
    key                  = "state-files/terraform.tfstate"      # Default state file
    region               = "us-east-1"                          # Bucket region
    encrypt              = true                                 # Enable encryption
    workspace_key_prefix = "state-files"                                      # Enable encryption
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
#  access_key = var.aws_access_key
 # secret_key = var.aws_secret_key
}