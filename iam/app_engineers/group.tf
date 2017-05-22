data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "${aws_iam_role.app_engineer.arn}",
    ]
  }
}

resource "aws_iam_policy" "assume_role" {
  name   = "ARP-appengineer"
  policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_group_policy_attachment" "assume_role" {
  group      = "${aws_iam_group.app_engineer.name}"
  policy_arn = "${aws_iam_policy.assume_role.arn}"
}

resource "aws_iam_group" "app_engineer" {
  name = "ARG-appengineer"
}
