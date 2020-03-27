resource "aws_sqs_queue" "build_sandbox" {
    name = "${var.account_name}-${var.project}-build-sandbox-${var.env}"

    tags = {
        env             = var.env
        project         = var.project
        deploy_type     = var.deploy_type
        account_name    = var.account_name
    }
}

output "build_sandbox_arn" {
    value = aws_sqs_queue.build_sandbox.arn
}