// instantiate the cloudtrail module only supplying required parameters with the intent of really exercising the defaults
//  trusting_account_id     = "251278935035"
//  trusting_policies       = ["app_eng_std"]
//  users_in_group          = ["appengineer1", "appengineer2"]
//  trusting_account_id     = "251278935035"

module "it_minimal" {
  source = "../../../" //minimal integration test

  trusted_user_group_name = "platform_engineer"
  trusted_account_id      = "261468575765"
  trusting_policy         = "minimal-test"
}
