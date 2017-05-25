resource "aws_iam_user" "user" {
  name  = "${element(var.users, count.index)}"
  count = "${length(var.users)}"
}

resource "aws_iam_group_membership" "group_membership" {
  name       = "${var.group_name}"
  users      = ["${var.users}"]
  group      = "${aws_iam_group.group.name}"
  depends_on = ["aws_iam_user.user"]
}

resource "aws_iam_access_key" "key" {
  user       = "${element(var.users, count.index)}"
  count      = "${length(var.users)}"
  depends_on = ["aws_iam_user.user"]
}
