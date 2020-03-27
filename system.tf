module "sqs" {
  source        = "./sqs"
  account_name  = local.account_name
  deploy_type   = local.deploy_type
  project       = "cicd"
  env           = local.env
}

module "iam" {
  source            = "./iam"
  account_name      = local.account_name
  deploy_type       = local.deploy_type
  project           = "cicd"
  env               = local.env
  
  build_sqs_arn  = local.build_sqs_arn
}