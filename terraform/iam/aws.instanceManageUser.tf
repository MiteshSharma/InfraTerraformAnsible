resource "aws_iam_user" "instanceManageUser" {
  name = "instanceManageUser"
}

resource "aws_iam_access_key" "instanceManageUser" {
  user = "${aws_iam_user.instanceManageUser.name}"
}

resource "aws_iam_user_policy" "instanceManageUser_assume_role" {
  name = "InstanceManagePolicy"
  user = "${aws_iam_user.instanceManageUser.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
            	"ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:StartInstances",
                "ec2:TerminateInstances",
                "ec2:Describe*",
                "ec2:CreateTags",
                "ec2:RequestSpotInstances"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
