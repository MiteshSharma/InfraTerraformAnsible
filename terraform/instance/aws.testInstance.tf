#resources
resource "aws_instance" "testInstance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_public_id}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name = "${var.key_pair_name}"
  iam_instance_profile = "${var.instance_profile_id}"

  tags {
		"Names" = "${var.name_tag}"
		"Environment" = "${var.environment_tag}"
	}
}

resource "aws_eip" "testInstanceEip" {
  vpc       = true
  instance  = "${aws_instance.testInstance.id}"

  tags {
    "Names" = "${var.name_tag}"
    "Environment" = "${var.environment_tag}"
  }
}
