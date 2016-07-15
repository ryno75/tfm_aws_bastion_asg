//
// Module: tfm_aws_bastion_asg
//

// This template creates the following resources
// - VPC Elastic IP Address (eip)
// - VPC AutoScaling Launch Configuration (aslc)
// - VPC AutoScaling Group (asg)
// - A template file for the Launch Configuration UserData (user_data)

resource "aws_eip" "eip" {
  vpc = true
}

resource "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
  vars {
    eip_id = "${aws_eip.eip.id}"
    aws_region = "${var.aws_region}"
  }
}

resource "aws_launch_configuration" "aslc" {
  name                        = "${var.aslc_name}"
  associate_public_ip_address = true
  iam_instance_profile        = "${var.instance_profile}"
  image_id                    = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_group}"]
  user_data                   = "${template_file.user_data.rendered}"
}

resource "aws_autoscaling_group" "asg" {
  name                  = "${var.asg_name}"
  availability_zones    = "${compact(split(",", var.azs))}"
  health_check_type     = "EC2"
  desired_capacity      = 1
  launch_configuration  = "${aws_launch_configuration.aslc.id}"
  max_size              = 1
  min_size              = 1
  tag {
    key = "Name"
    value = "${var.bastion_name}"
    propagate_at_launch = true
  }
  vpc_zone_identifier   = ["${split(",", var.subnet_ids)}"]
}

