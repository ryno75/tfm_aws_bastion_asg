//
// Module: tfm_aws_bastion_asg
//

// EIP Public IP Address
output "public_ip" {
    value = "${aws_eip.eip.public_ip}"
}

// AutoScaling Launch Config ID
output "aslc_id" {
    value = "${aws_launch_configuration.aslc.id}"
}

// AutoScaling Group ID
output "asg_id" {
    value = "${aws_autoscaling_group.asg.id}"
}

