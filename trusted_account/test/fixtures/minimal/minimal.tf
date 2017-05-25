// instantiate the cloudtrail module only supplying required parameters with the intent of really exercising the defaults
//  trusted_account_id      = "261468575765"
//  trusting_policies       = ["app_eng_std"]
//  trusting_account_id     = "251278935035"
//  trusting_policy         = "minimal-test"

module "it_minimal" {
  source = "../../../" //minimal integration test

  users_in_group          = ["appengineer1", "appengineer2"]
  trusted_user_group_name = "platform_engineer"
  trusting_account_id     = "251278935035"
}
