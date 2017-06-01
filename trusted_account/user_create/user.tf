resource "aws_iam_user" "user" {
  name  = "${element(var.users_in_group, count.index)}"
  count = "${length(var.users_in_group)}"
}

resource "aws_iam_access_key" "key" {
  user       = "${element(var.users_in_group, count.index)}"
  count      = "${length(var.users_in_group)}"
  depends_on = ["aws_iam_user.user"]
}
