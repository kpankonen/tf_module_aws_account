#
# define the cross-account role here
#

output "cross-account-role-arn" {
  value = "${aws_iam_role.cross-account-role.arn}"
}

output "cross-account-role-name" {
  value = "${aws_iam_role.cross-account-role.name}"
}

output "cross-account-policy-arn" {
  value = "${aws_iam_policy.cross-account-policy.arn}"
}

output "cross-account-policy-name" {
  value = "${aws_iam_policy.cross-account-policy.name}"
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trusted-account-role-policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    #condition {
    #  test = "Bool"
    #  variable = "aws:MultiFactorAuthPresent"
    #  values = ["true"]
    #}
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.trusted_account}:root"]
    }
  }
}

#resource "aws_iam_policy" "cross-account-policy" {
#  name        = "test-policy"
#  description = "A test policy"
#
#  policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": [
#        "ec2:Describe*"
#      ],
#      "Effect": "Allow",
#      "Resource": "*"
#    }
#  ]
#}
#EOF
#}

data "template_file" "json_policy" {
  template = "${file("${path.module}/templates/${var.policy_name}.json")}"
}

resource "aws_iam_policy" "cross-account-policy" {
  name   = "${var.policy_name}"
  policy = "${data.template_file.json_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = "${aws_iam_role.cross-account-role.name}"
  policy_arn = "${aws_iam_policy.cross-account-policy.arn}"
}

resource "aws_iam_role" "cross-account-role" {
  name               = "AR-${var.group_name}"
  assume_role_policy = "${data.aws_iam_policy_document.trusted-account-role-policy.json}"
}
