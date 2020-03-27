resource "aws_iam_instance_profile" "build_ec2" {
  name = "${var.account_name}-${var.project}-build-ec2-${var.env}"
  role = aws_iam_role.build_ec2.name
}

resource "aws_iam_role" "build_ec2" {
  name = "${var.account_name}-${var.project}-build-ec2-${var.env}"

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
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "build_ec2" {
  name    = "${var.account_name}-${var.project}-build-ec2-${var.env}"
  role    = aws_iam_role.build_ec2.id
  policy  = data.aws_iam_policy_document.build_ec2.json
}

data "aws_iam_policy_document" "build_ec2" {
  statement {
    sid       = "s3"
    effect    = "Allow"
    actions   = [
      "s3:List*",
      "s3:Get*",
      "s3:Put*",
      "s3:DeleteObject"
    ]
    resources = [
      var.artifacts_bucket_arn
    ]
  }
}