//
// Module: tfm_aws_bastion_asg
//

variable "aws_region" {}
variable "ami_id" {}
variable "instance_type" {}
variable "instance_profile" {}
variable "key_name" {}
variable "security_group" {}

variable "aslc_name" {
  default = "bastion_launch_config"
  description = "AutoScaling Launch Configuration Name"
}

variable "asg_name" {
  default = "bastion_autoscaling_group"
  description = "AutoScaling Group Name"
}

variable "bastion_name" {
  default = "bastion"
  description = "Bastion Instance Name"
}

variable "health_check_type" {
  default = "EC2"
  description = "AutoScaling Health Check Type (EC2 or ELB)"
}

variable "subnet_ids" {
  description = "Comma separated list of VPC subnet IDs"
}

variable "azs" {
  // highly recommend using the subnet_ids variable instead
  default = ""
  description = "Comma separated list of Availability Zones"
}

// Variables for providers used in this module
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

