resource "aws_s3_bucket" "dl" {
  bucket = "datalake-mso-xpe-edc-tf"
  
  force_destroy = true

  tags = {
    MBA   = "XPE"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dl" {
  bucket = "datalake-mso-xpe-edc-tf"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "dl" {
  bucket = "datalake-mso-xpe-edc-tf"
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "dl" {
    bucket = "datalake-mso-xpe-edc-tf"

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "dl" {
  bucket = "datalake-mso-xpe-edc-tf"
  rule{
    object_ownership = "ObjectWriter"
  }
}