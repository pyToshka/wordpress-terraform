resource "aws_db_instance" "rds" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.6.27"
  instance_class       = "${var.rdstype}"
  name                 = "${var.dbname}"
  username             = "${var.username}"
  password             = "${var.password}"
  db_subnet_group_name = "${aws_db_subnet_group.rds.name}"
  publicly_accessible   =  "${var.publicly_accessible}"
  vpc_security_group_ids   = ["${aws_security_group.rds.id}"]
  skip_final_snapshot       = false
  final_snapshot_identifier = "final-snapshot-${md5(timestamp())}"
}

resource "aws_db_subnet_group" "rds" {
  name       = "subnet_group"
  subnet_ids = ["${aws_subnet.public_subnet_zoneA.id}", "${aws_subnet.public_subnet_zoneB.id}"]
}
