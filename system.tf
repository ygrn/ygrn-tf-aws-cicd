module "sqs" {
  source = "./sqs"

  account_name  = local.account_name
  deploy_type   = local.deploy_type
  project       = local.project
  env           = local.env
}

module "iam" {
  source = "./iam"
  
  account_name      = local.account_name
  deploy_type       = local.deploy_type
  project           = local.project
  env               = local.env
  
  build_sqs_arn         = local.build_sqs_arn
  artifacts_bucket_arn  = local.artifacts_bucket_arn
  serverless_bucket_arn = local.serverless_bucket_arn
}

module "s3" {
  source = "./s3"

  account_name  = local.account_name
  deploy_type   = local.deploy_type
  project       = local.project
  env           = local.env
}