module "networkModule" {
    source			= "./vpc"
 	access_key		= "${var.access_key}"
	secret_key		= "${var.secret_key}"
	region			= "${var.region}"
	environment_tag = "${var.environment_tag}"
}

module "securityGroupModule" {
    source			= "./securityGroup"
 	access_key		= "${var.access_key}"
	secret_key		= "${var.secret_key}"
	region			= "${var.region}"
	vpc_id			= "${module.networkModule.vpc_id}"
	environment_tag = "${var.environment_tag}"
}

module "letsEncryptS3BucketModule" {
	source 			= "./s3"
 	access_key 		= "${var.access_key}"
	secret_key 		= "${var.secret_key}"
	region     		= "${var.region}"
	bucket_names	= ["letsencryptcerts"]
	environment_tag = "${var.environment_tag}"
}

data "template_file" "s3_access_iam_policy" {
  template = "${file("files/s3_access_iam_policy.json")}"
  vars {
  	bucket_name = "letsencryptcerts"
  }
}

module "s3BucketAccessInstaneProfile" {
	source 		= "./instanceProfile"
 	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	policy 		= "${data.template_file.s3_access_iam_policy.rendered}"
}