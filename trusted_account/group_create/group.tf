data "aws_iam_policy_document" "policy_document" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    resources = ["arn:aws:iam::${var.trusting_account}:role/TR-${var.trusted_group_name}"]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.trusted_group_name}"
  policy = "${data.aws_iam_policy_document.policy_document.json}"
}

resource "aws_iam_group_policy_attachment" "group_policy_attach" {
  group      = "${aws_iam_group.group.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_group" "group" {
  name = "${var.trusted_group_name}"
}
