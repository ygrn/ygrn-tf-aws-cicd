resource "aws_s3_bucket" "serverless" {
  bucket = "${var.account_name}-${var.project}-serverless-${var.env}"
  acl    = "private"

  tags = {
      env             = var.env
      project         = var.project
      deploy_type     = var.deploy_type
      account_name    = var.account_name
  }
}

output "serverless_arn" {
    value = aws_s3_bucket.serverless.arn
}