resource "aws_launch_configuration" "ec2" {
  lifecycle { create_before_destroy = true }
  name                 = "wp-configuration-${var.time}"
  instance_type        = "${var.instance_type}"
  image_id             = "${var.image_id}"
  security_groups      = ["${var.security_groups}"]
  key_name             = "${var.key_name}"
  associate_public_ip_address = true
}

resource "aws_autoscaling_group" "ec2" {
  name                 = "wp-autoscale-${var.time}"
  depends_on = ["aws_launch_configuration.ec2"]
  lifecycle { create_before_destroy = true }
  force_delete         = true
  vpc_zone_identifier  = ["${var.vpc_zone_identifier}"]
  launch_configuration = "${aws_launch_configuration.ec2.name}"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  load_balancers       = ["${aws_elb.ec2.name}"]
}

resource "aws_elb" "ec2" {
  name               = "wordpress-elb-${var.time}"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.vpc_zone_identifier}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}

