resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket
    tags = {
      Creator="Divya"
      Env = "Dev"
    }
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
    bucket = aws_s3_bucket.bucket.id
    rule{
        object_ownership = "BucketOwnerEnforced"
    }

  
}
resource "aws_s3_bucket_public_access_block" "access" {
    bucket = aws_s3_bucket.bucket.id
    block_public_acls = true
    ignore_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true
}
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.version_status
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.bucket.id
    rule{
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
    }
}
}

resource "aws_s3_bucket_cors_configuration" "cors_config" {
  bucket = aws_s3_bucket.bucket.id
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://www.google.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 4000
  }
  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = ["GET"]
  }
  
}

