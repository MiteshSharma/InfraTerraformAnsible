output "instance_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${aws_instance.testInstance.public_ip}"
}

output "instance_eip" {
  value = "${aws_eip.testInstanceEip.public_ip}"
}