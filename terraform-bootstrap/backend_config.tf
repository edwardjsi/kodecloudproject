# Bootstrap file - run ONCE with privileged creds to create the bucket

resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops-terraform-state-20251224"

  tags = {
    Name        = "Terraform State Bucket"
    Purpose     = "KodeKloud Day 18 Remote Backend"
    CreatedDate = "2025-12-24"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}