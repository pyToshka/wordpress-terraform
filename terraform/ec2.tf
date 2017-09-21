resource "aws_instance" "jenkins-master" {
  count                = 1
  ami                  = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.ec2_egress.id}","${aws_security_group.ec2_ingress.id}"]
  subnet_id            = "${aws_subnet.public_subnet_zoneA.id}"
  key_name             = "${var.key_name}"
  associate_public_ip_address = true
  tags {
    Name          = "jenkins-master"
  }
  //air
}
resource "aws_s3_bucket" "bucket" {
  bucket = "rds-backup-bucket"
  acl    = "private"

  tags {
    Name        = "Bucket for rds backup"
    Environment = "Dev"
  }
}
