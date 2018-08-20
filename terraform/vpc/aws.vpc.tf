#resources
resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block_range}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags {
    "Names" = "${var.name_tag}"
    "Environment" = "${var.environment_tag}"
  }
}