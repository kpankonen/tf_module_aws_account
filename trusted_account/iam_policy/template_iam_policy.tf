data "template_file" "json_policy" {
  template = "${file("${path.module}/templates/${var.policy_name}.json")}"
}

resource "aws_iam_policy" "template-cross-account-policy" {
  name        = "${var.policy_name}"
  description = "${var.policy_description}"
  policy      = "${data.template_file.json_policy.rendered}"
}
