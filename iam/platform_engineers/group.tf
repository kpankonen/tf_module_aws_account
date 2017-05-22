data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "${aws_iam_role.platform_engineer.arn}",
    ]
  }
}

resource "aws_iam_policy" "assume_role" {
  name   = "ARP-platform-engineer"
  policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_group_policy_attachment" "assume_role" {
  group      = "${aws_iam_group.platform_engineer.name}"
  policy_arn = "${aws_iam_policy.assume_role.arn}"
}

resource "aws_iam_group" "platform_engineer" {
  name = "ARG-platform-engineer"
}
