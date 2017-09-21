
output "id" {
  value = "${aws_db_instance.rds.id}"
}

output "database_security_group_id" {
  value = "${aws_security_group.rds.id}"
}

output "hosted_zone_id" {
  value = "${aws_db_instance.rds.hosted_zone_id}"
}

output "hostname" {
  value = "${aws_db_instance.rds.address}"
}

output "port" {
  value = "${aws_db_instance.rds.port}"
}

output "endpoint" {
  value = "${aws_db_instance.rds.endpoint}"
}

output "username" {
  value = "${aws_db_instance.rds.username}"
}

output "password" {
  value = "${aws_db_instance.rds.password}"
}

output "database" {
  value = "${aws_db_instance.rds.name}"
}
output "subnet_ids"{
  value = "${aws_db_subnet_group.rds.id}"
}
output"subnet_name"{
  value = "${aws_db_subnet_group.rds.name}"
}
output "aws_ami" {
  value = "${aws_instance.jenkins-master.ami}"
}