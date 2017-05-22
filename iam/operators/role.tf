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
# Read Only
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
# Admin
#

resource "aws_iam_role_policy_attachment" "operator" {
  role       = "${aws_iam_role.operator.name}"
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role" "operator" {
  name               = "AR-operator"
  assume_role_policy = "${data.aws_iam_policy_document.assume_trust.json}"
}
