output "id" {
  value       = aws_s3_bucket.s3_bucket.id
  description = "The name of the bucket"
}

output "arn" {
  value       = aws_s3_bucket.s3_bucket.arn
  description = "The ARN of the bucket. Will be of format `arn:aws:s3:::bucketname`"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
  description = "The bucket domain name. Will be of format `bucketname.s3.amazonaws.com`."
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
  description = "The bucket region-specific domain name."
}

output "bucket_tags" {
  value       = aws_s3_bucket.s3_bucket.tags
  description = "For integration testing purposes"
}