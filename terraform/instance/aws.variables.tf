# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-2"
}
variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = "list"
  default = []
}
variable "instance_profile_id" {
  description = "Instance profile"
  default = ""
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
variable "name_tag" {
  description = "Name tag"
  default = ""
}
variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}

# instance details
variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-0cf31d971a3ca20d6"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}
variable "instance_counts" {
  description = "EC2 instance counts"
  default = 1
}
variable "instance_attach_eip" {
  description = "EC2 instance EIP attach"
  default = 1
}

# spot instance params
variable "spot_instance_counts" {
  description = "EC2 spot instance counts"
  default = 0
}
variable "spot_instance_type" {
  description = "EC2 spot instance type"
  default = "one-time"
}
variable "spot_price" {
  description = "EC2 spot instance price"
  default = 0.02
}
variable "spot_wait_for_fulfillment" {
  description = "EC2 spot instance wait for fulfillment"
  default = true
}