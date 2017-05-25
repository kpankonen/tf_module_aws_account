variable "users_in_group" {
  type    = "list"
  default = ["app_eng1", "app_eng2"]
}

variable "trusted_user_group_name" {
  type    = "string"
  default = "trusted_group_test"
}

variable "trusting_account_id" {
  type    = "string"
  default = "251278935035"
}
