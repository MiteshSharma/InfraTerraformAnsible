resource "aws_iam_role" "ec2_instance_iam_role" {
	name = "ec2_instance_iam_role"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "ec2.amazonaws.com"
			},
			"Effect": "Allow",
			"Sid": ""
		}
	]
}
EOF
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
	name = "iam_instance_profile"
	role = "${aws_iam_role.ec2_instance_iam_role.name}"
}

resource "aws_iam_role_policy" "s3_iam_role_policy" {
	name 	= "s3_iam_role_policy"
	role 	= "${aws_iam_role.ec2_instance_iam_role.id}"
	policy 	= "${var.policy}"
}