// instantiate the cloudtrail module only supplying required parameters with the intent of really exercising the defaults

//module "it_minimal" {
//  source = "../../../" //minimal integration test
//  users_in_group          = ["appengineer1", "appengineer2"]
//  trusted_user_group_name = "platform_engineer"
//  trusting_account_id     = "251278935035"
//}

module "platform_eng_user_create" {
  source         = "../../../user_create"
  users_in_group = ["appengineer1", "appengineer2"]
}

module "platform_eng_group_create" {
  source             = "../../../group_create"
  trusted_group_name = "platform_eng"
  trusting_account   = "251278935035"
}

module "platform_eng_membership" {
  source          = "../../../membership_to_group"
  users_in_group  = ["${module.platform_eng_user_create.trusted.iam_user_name}"]
  user_group_name = "${module.platform_eng_group_create.trusted.iam_group_name}"
}
