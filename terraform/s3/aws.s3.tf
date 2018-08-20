resource "aws_s3_bucket" "s3Bucket" {
  bucket = "${element(var.bucket_names, count.index)}"
  acl    = "private"
  count	 = "${length(var.bucket_names)}"

  tags {
    "Names" = "${var.name_tag}"
    "Environment" = "${var.environment_tag}"
  }
}