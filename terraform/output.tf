output "base_domain_nameservers" {  
  value = "${module.route53Module.domain_name_servers}"
}
output "server_instance_ip" {  
  value = "${module.serverInstanceModule.instance_eip}"
}
output "jenkins_instance_ip" {  
  value = "${module.jenkinsInstanceModule.instance_eip}"
}
output "prometheus_instance_ip" {  
  value = "${module.prometheusInstanceModule.instance_eip}"
}