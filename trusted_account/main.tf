module "platform_eng_user_create" {
  source         = "./user_create"
  users_in_group = ["appengineer1", "appengineer2"]
}

module "platform_eng_group_create" {
  source             = "./group_create"
  trusted_group_name = "platform_eng"
  trusting_account   = "251278935035"
}

module "platform_eng_membership" {
  source          = "./membership_to_group"
  users_in_group  = ["appengineer1", "appengineer2"]
  user_group_name = "platform_eng"
}
