variable "region" {}
variable "instance_type" {}
variable "aws_key_name" {
  default = ""
}

variable "ami_id" {
  default = ""
}
variable "access_key" {}
variable "secret_key" {}
variable "password" {}
variable "username" {}
variable "dbname" {}
variable "rdstype" {}
variable "publicly_accessible" {
  description = "Determines if database can be publicly available (NOT recommended)"
  default     = true
}
variable "image_id"{}
variable "key_name" {}
