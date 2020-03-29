locals {
    account_name    = var.account_name
    default_vpc_id  = data.aws_vpc.default.id
    env             = var.env
    deploy_type     = var.deploy_type
    project         = var.project
}