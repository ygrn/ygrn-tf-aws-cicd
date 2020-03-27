resource "aws_iam_role" "build" {
  name = "${var.account_name}-${var.project}-build-sandbox-${var.env}"

  tags = {
      env             = var.env
      project         = var.project
      deploy_type     = var.deploy_type
      account_name    = var.account_name
  }

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "build" {
  name    = "${var.account_name}-${var.project}-build-sandbox-${var.env}"
  role    = aws_iam_role.build.id
  policy  = data.aws_iam_policy_document.build.json
}

data "aws_iam_policy_document" "build" {
  statement {
    sid       = "sqs"
    effect    = "Allow"
    actions   = [
      "sqs:List*",
      "sqs:Get*",
      "sqs:SendMessage"
    ]
    resources = [
      var.build_sandbox_sqs_arn
    ]
  }

  statement {
    sid       = "logs"
    effect    = "Allow"
    actions   = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "*"
    ]
  }
}