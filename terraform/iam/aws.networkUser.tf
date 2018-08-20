#resources
resource "aws_iam_user" "networkManageUser" {
  name = "networkManageUser"
}

resource "aws_iam_access_key" "networkManageUser" {
  user = "${aws_iam_user.networkManageUser.name}"
}

resource "aws_iam_user_policy" "networkManageUser_assume_role" {
  name = "VPCManagePolicy"
  user = "${aws_iam_user.networkManageUser.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement":[
    {
	    "Action":["ec2:*Vpc*",
	              "ec2:*Subnet*",
	              "ec2:*Gateway*",
	              "ec2:*Vpn*",
	              "ec2:*Route*",
	              "ec2:*Address*",
	              "ec2:*SecurityGroup*",
	              "ec2:*NetworkAcl*",
	              "ec2:*DhcpOptions*",
	              "ec2:*InternetGateway*",
                  "ec2:*Tags*",
                  "ec2:*NetworkInterface*"],
	    "Effect":"Allow",
	    "Resource":"*"
    }
  ]
}
EOF
}