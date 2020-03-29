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
  
  build_sqs_arn         = module.sqs.build_arn
  artifacts_bucket_arn  = module.s3.artifacts_arn
  serverless_bucket_arn = module.s3.serverless_arn
  cicd_table_arn        = module.dynamodb.cicd_arn
}

module "s3" {
  source = "./s3"

  account_name  = local.account_name
  deploy_type   = local.deploy_type
  project       = local.project
  env           = local.env
}

module "dynamodb" {
  source = "./dynamodb"

  account_name  = local.account_name
  deploy_type   = local.deploy_type
  project       = local.project
  env           = local.env
}