variable "operators" {
  type = "list"
}

resource "aws_iam_user" "operator" {
  name  = "${element(var.operators, count.index)}"
  count = "${length(var.operators)}"
}

resource "aws_iam_group_membership" "operator" {
  name       = "operator"
  users      = "${var.operators}"
  group      = "${aws_iam_group.operator.name}"
  depends_on = ["aws_iam_user.operator"]
}

resource "aws_iam_access_key" "operator" {
  user       = "${element(var.operators, count.index)}"
  count      = "${length(var.operators)}"
  depends_on = ["aws_iam_user.operator"]
}
