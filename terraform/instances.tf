module "serverInstanceModule" {
	source 				= "./instance"
	access_key 			= "${var.access_key}"
 	secret_key 			= "${var.secret_key}"
 	region     			= "${var.region}"
 	vpc_id 				= "${module.networkModule.vpc_id}"
	subnet_public_id	="${module.networkModule.public_subnets[0]}"
	key_pair_name		="${module.networkModule.ec2keyName}"
	instance_profile_id = "${module.s3BucketAccessInstaneProfile.instance_profile_id}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80_443}", "${module.securityGroupModule.sg_9100}"]
	environment_tag 	= "${var.environment_tag}"
	name_tag			= "WebServer"
}

module "prometheusInstanceModule" {
	source 				= "./instance"
	access_key 			= "${var.access_key}"
 	secret_key 			= "${var.secret_key}"
 	region     			= "${var.region}"
 	vpc_id 				= "${module.networkModule.vpc_id}"
	subnet_public_id	="${module.networkModule.public_subnets[0]}"
	key_pair_name		="${module.networkModule.ec2keyName}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80_443}", "${module.securityGroupModule.sg_9100}"]
	instance_profile_id = "${module.s3BucketAccessInstaneProfile.instance_profile_id}"
	environment_tag 	= "${var.environment_tag}"
	name_tag			= "PrometheusServer"
}

module "jenkinsInstanceModule" {
	source 				= "./instance"
	access_key 			= "${var.access_key}"
 	secret_key 			= "${var.secret_key}"
 	region     			= "${var.region}"
 	vpc_id 				= "${module.networkModule.vpc_id}"
	subnet_public_id	="${module.networkModule.public_subnets[0]}"
	key_pair_name="${module.networkModule.ec2keyName}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80_443}", "${module.securityGroupModule.sg_9100}"]
	instance_profile_id = "${module.s3BucketAccessInstaneProfile.instance_profile_id}"
	environment_tag 	= "${var.environment_tag}"
	name_tag			= "JenkinsServer"
}

module "route53Module" {
	source 		= "./route53"
 	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	domain_name	= "miteshsharma.com"
	aRecords	= [
		"miteshsharma.com ${module.serverInstanceModule.instance_eip}",
		"ci.miteshsharma.com ${module.jenkinsInstanceModule.instance_eip}",
		"prometheus.miteshsharma.com ${module.prometheusInstanceModule.instance_eip}",
		"grafana.miteshsharma.com ${module.prometheusInstanceModule.instance_eip}"
	]
	cnameRecords	= [
		"www.miteshsharma.com miteshsharma.com"
	]
}
