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

variable "trusted_account_id" {
  type    = "string"
  default = "261468575765"
}

variable "trusting_policy" {
  type    = "string"
  default = "minimal-test"
}

variable "trusting_policies" {
  type    = "list"
  default = ["app_eng_std"]
}
