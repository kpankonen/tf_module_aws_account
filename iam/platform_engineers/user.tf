variable "platform_engineers" {
  type = "list"
}

resource "aws_iam_user" "platform_engineer" {
  name  = "${element(var.platform_engineers, count.index)}"
  count = "${length(var.platform_engineers)}"
}

resource "aws_iam_group_membership" "platform_engineer" {
  name       = "platform_engineer"
  users      = "${var.platform_engineers}"
  group      = "${aws_iam_group.platform_engineer.name}"
  depends_on = ["aws_iam_user.platform_engineer"]
}

resource "aws_iam_access_key" "platform_engineer" {
  user       = "${element(var.platform_engineers, count.index)}"
  count      = "${length(var.platform_engineers)}"
  depends_on = ["aws_iam_user.platform_engineer"]
}
