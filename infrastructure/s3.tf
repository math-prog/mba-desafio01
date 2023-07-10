resource "aws_s3_bucket" "dl" {
  bucket = "datalake-mso-xpe-edc-tf"
  
  tags = {
    MBA   = "XPE"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = "datalake-mso-xpe-edc-tf"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = "datalake-mso-xpe-edc-tf"
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = "datalake-mso-xpe-edc-tf"
  rule{
    object_ownership = "ObjectWriter"
  }
}