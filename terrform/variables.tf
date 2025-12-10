variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name (must be globally unique)"
  default     = "kanagaraj-law-firm-<REPLACE_WITH_UNIQUE>"
}
