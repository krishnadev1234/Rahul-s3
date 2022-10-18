data "aws_region" "current" {}

locals {
  sse             = var.use_kms && !var.log_bucket ? "aws:kms" : "AES256"
  }
data "aws_kms_key" "kms_key" {
  count  = var.use_kms ? 1 : 0
  key_id = var.kms_key
}