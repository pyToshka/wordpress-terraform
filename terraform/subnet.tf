resource "aws_subnet" "public_subnet_zoneA" {
  vpc_id = "${aws_vpc.vpc_wordpress.id}"
  availability_zone = "${var.region}a"
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "public_subnet_zoneB" {
  vpc_id = "${aws_vpc.vpc_wordpress.id}"
  availability_zone = "${var.region}b"
  cidr_block = "10.0.1.0/24"
}