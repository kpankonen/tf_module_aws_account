data "aws_caller_identity" "account_info" {}

data "aws_iam_policy_document" "assume_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.account_info.account_id}:root"]
    }
  }
}

#
# define the access type here (managed policies)
#
#
#resource "aws_iam_role_policy_attachment" "read_only_access" {
#  role       = "${aws_iam_role.read_only.name}"
#  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
#}
#
#resource "aws_iam_role" "read_only" {
#  name               = "read-only"
#  assume_role_policy = "${data.aws_iam_policy_document.assume_trust.json}"
#}

#
# platform_engineer
#

resource "aws_iam_role_policy_attachment" "platform_engineer" {
  role       = "${aws_iam_role.platform_engineer.name}"
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role" "platform_engineer" {
  name               = "AR-platform-engineer"
  assume_role_policy = "${data.aws_iam_policy_document.assume_trust.json}"
}
