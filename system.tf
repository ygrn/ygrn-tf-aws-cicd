module "security_groups" {
  source        = "./security_groups"
  account_name  = local.account_name
  main_vpc_id   = local.main_vpc_id
}