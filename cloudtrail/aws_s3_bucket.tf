// AWS CloudTrail S3 Bucket
data "template_file" "aws_s3_bucket_policy" {
  template = "${file("${path.module}/aws_s3_bucket_policy.tpl")}"

  vars {
    aws_account_id = "${var.aws_account_id}"
    s3_bucket_arn  = "${aws_s3_bucket.bucket.arn}"
  }
}

resource "aws_s3_bucket" "bucket" {
  # keep things consistrent & prevent conflicts across envs.
  bucket = "${var.aws_bucket_prefix}-${var.s3_bucket_name}"
  acl    = "private"

  versioning = {
    enabled = "false"
  }

  force_destroy = "${var.s3_force_destroy}"

  tags = {
    terraform = "true"
  }
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy = "${data.template_file.aws_s3_bucket_policy.rendered}"
}
