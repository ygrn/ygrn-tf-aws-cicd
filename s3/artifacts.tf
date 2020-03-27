resource "aws_s3_bucket" "artifacts" {
  bucket = "${var.account_name}-${var.project}-artifacts-${var.env}"
  acl    = "private"

  tags = {
      env             = var.env
      project         = var.project
      deploy_type     = var.deploy_type
      account_name    = var.account_name
  }
}

output "artifacts_arn" {
    value = aws_s3_bucket.artifacts.arn
}