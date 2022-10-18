variable "aws_access_key" {
  type        = string
  description = "Enter the access key"
  default = ""
}

variable "aws_secret_key" {
  type        = string
  description = "Enter the secret key"
  default = ""
}

variable "region" {
  type        = string
  description = "Enter the region"
  default = "eu-west-1"
}
variable "bucket_name" {
  type        = string
  description = "The bucket name is not required when creating a log bucket."
  default     = "cloudvault-sit-febucket-test-v1"
}

variable "acl_value" {
  type        = string
  description = "Enter acl value"
  default     = "private"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to attach to the bucket."
  default     = {}
}

variable "EnvironmentName" {
  type        = string
  description = "Name for your Environment."
  default = "dev"
}

variable "DaystoExpiry" {
  type        = string
  description = "Enter Days to keep object in S3."
  default = "60"
}

variable "StorageClass" {
  type        = string
  description = "Enter S3 Storage type."
  default = "INTELLIGENT_TIERING"
}

variable "TransitionInDays" {
  type        = string
  description = "Enter Days before Transit."
  default = "15"
}

variable "use_kms" {
  type        = bool
  description = "Set to false if you are creating a web content bucket for use with CloudFront."
  default     = true
}

variable "kms_key" {
  type        = string
  description = "Provide a KMS key alias, Id or ARN if you are using KMS and want to use your own CMK to protect the bucket."
  default     = "alias/aws/s3"
}

variable "log_bucket" {
  description = "Set to true if this a server access log bucket."
  type        = bool
  default     = false
}


