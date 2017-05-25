output "trusting.iam_policy" {
  value = "${aws_iam_policy.cross-account-policy.name}"
}
