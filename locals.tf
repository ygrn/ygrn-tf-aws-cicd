locals {
    account_name    = var.account_name
    main_vpc_id     = data.aws_vpc.main.id
    env             = var.env
    deploy_type     = var.deploy_type

    build_sandbox_sqs_arn = module.sqs.build_sandbox_arn
}