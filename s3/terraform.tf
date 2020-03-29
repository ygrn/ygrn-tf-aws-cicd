resource "aws_s3_bucket" "terraform" {
  bucket = "${var.account_name}-${var.project}-terraform-${var.env}"
  acl    = "private"

  tags = {
      env             = var.env
      project         = var.project
      deploy_type     = var.deploy_type
      account_name    = var.account_name
  }
}

output "terraform_arn" {
    value = aws_s3_bucket.terraform.arn
}