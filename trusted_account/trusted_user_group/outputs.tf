output "trusted.iam_group_name" {
  value = "${aws_iam_group.group.name}"
}

output "trusted.iam_policy" {
  value = "${aws_iam_policy.policy.name}"
}
