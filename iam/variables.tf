variable "account_name" {
  type = string
}

variable "deploy_type" {
  type = string
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

# dependencies (module outputs)
variable "build_sqs_arn" {
  type = string
}

variable "artifacts_bucket_arn" {
  type = string
}

variable "serverless_bucket_arn" {
  type = string
}

variable "cicd_table_arn" {
  type = string
}