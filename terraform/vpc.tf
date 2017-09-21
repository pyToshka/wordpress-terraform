resource "aws_vpc" "vpc_wordpress" {
  enable_dns_hostnames = true
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc_wordpress.id}"
}



resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc_wordpress.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }
}



resource "aws_route_table_association" "public_zoneA" {
  subnet_id = "${aws_subnet.public_subnet_zoneA.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_zoneB" {
  subnet_id = "${aws_subnet.public_subnet_zoneB.id}"
  route_table_id = "${aws_route_table.public.id}"
}
