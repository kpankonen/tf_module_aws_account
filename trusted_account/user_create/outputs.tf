output "trusted.iam_user_name" {
  value = ["${aws_iam_user.user.name}"]
}
