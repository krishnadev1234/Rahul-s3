provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}
resource "aws_s3_bucket" "s3_bucket" { 
    bucket = "${var.bucket_name}.${var.EnvironmentName}" 
    acl = "${var.acl_value}" 
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id = "log"
    expiration {
      days = "${var.DaystoExpiry}"
    }
    status = "Enabled"

    transition {
      days          = "${var.TransitionInDays}"
      storage_class = "${var.StorageClass}"
    }
}
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status     = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.use_kms && !var.log_bucket ? data.aws_kms_key.kms_key[0].arn : null
      sse_algorithm     = local.sse
    }
  }
}
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
            effect = "Allow"
            actions = [
                "s3:PutObject",
                "s3:GetObject",
            ]
            resources = [
                "${aws_s3_bucket.s3_bucket.arn}",
                "${aws_s3_bucket.s3_bucket.arn}/*",
            ]
        }
}
