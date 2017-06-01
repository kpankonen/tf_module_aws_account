resource "aws_iam_group_membership" "group_membership" {
  name  = "${var.user_group_name}"
  users = ["${var.users_in_group}"]
  group = "${var.user_group_name}"
}
