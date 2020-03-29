resource "aws_dynamodb_table" "cicd" {
  name           = "${var.account_name}-${var.project}-configs-${var.env}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "full_name"
  range_key      = "branch"

  attribute {
    name = "full_name"
    type = "S"
  }

  attribute {
    name = "branch"
    type = "S"
  }
}

output "cicd_arn" {
    value = aws_dynamodb_table.cicd.arn
}