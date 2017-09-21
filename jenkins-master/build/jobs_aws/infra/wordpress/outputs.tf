output "elb_dns" {
  value = "${aws_elb.ec2.dns_name}"
}
