module "trusting_roles" {
  source          = "./trusting_role"
  group_name      = "${var.trusted_user_group_name}"
  policy_name     = "${var.trusting_policy}"
  trusted_account = "${var.trusted_account_id}"
}
