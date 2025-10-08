variable "s3_bucket_name" {
  type = string
}

variable "kms_alias_name" {
  type        = string
  description = "your own memorable alias for the kms key to hard code in your backend config in terraform configs you use this with e.g. yourname-tf-s3-key"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = ""
}

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = ""
}

variable "owner" {
  type = string
}