# Create S3 bucket
resource "aws_s3_bucket" "static_website" {
  bucket = var.website_bucket_name

  tags = {
    Name        = "My Terraform S3 Bucket"
    Environment = "Dev"
  }
}

# Enable versioning (for state file)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.static_website.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable encryption for state file
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.static_website.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Configure the bucket for static website hosting (without error document)
resource "aws_s3_bucket_website_configuration" "static_website_config" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = var.index_file
  }
}

# Disable public access restrictions
resource "aws_s3_bucket_public_access_block" "static_website_block" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html to the bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = var.index_file
  source       = var.index_file  # Ensure the file exists in the working directory
  content_type = "text/html"
}
