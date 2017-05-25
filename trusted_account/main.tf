module "trusted_users" {
  source           = "./trusted_user_group"
  users            = ["${var.users_in_group}"]
  group_name       = "${var.trusted_user_group_name}"
  trusting_account = "${var.trusting_account_id}"
}
