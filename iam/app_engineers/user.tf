variable "app_engineers" {
  type = "list"
}

resource "aws_iam_user" "app_engineer" {
  name  = "${element(var.app_engineers, count.index)}"
  count = "${length(var.app_engineers)}"
}

resource "aws_iam_group_membership" "app_engineer" {
  name       = "app_engineer"
  users      = "${var.app_engineers}"
  group      = "${aws_iam_group.app_engineer.name}"
  depends_on = ["aws_iam_user.app_engineer"]
}

resource "aws_iam_access_key" "app_engineer" {
  user       = "${element(var.app_engineers, count.index)}"
  count      = "${length(var.app_engineers)}"
  depends_on = ["aws_iam_user.app_engineer"]
}
