provider "aws" {
  region = var.aws_region
}


# center control file of terraform state
terraform {
  backend "s3" {
    bucket = "terraform-state-mso"
    key = "state/mba/edc/mod1/terraform.tfstate"
    region = "us-east-1"
  }
}