#resources
resource "aws_route53_zone" "domain" {
  name = "${var.domain_name}"
  tags {
    "Names" = "${var.name_tag}"
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_route53_record" "a_record_item" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  name    = "${element(split(" ", var.aRecords[count.index]),0)}"
  type    = "A"
  ttl     = "${var.ttl}"
  records = ["${element(split(" ", var.aRecords[count.index]),1)}"]
  count   = "${length(var.cnameRecords)}"
}

resource "aws_route53_record" "cname_record_item" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  name    = "${element(split(" ", var.cnameRecords[count.index]),0)}"
  type    = "CNAME"
  ttl     = "${var.ttl}"
  records = ["${element(split(" ", var.cnameRecords[count.index]),1)}"]
  count   = "${length(var.cnameRecords)}"
}