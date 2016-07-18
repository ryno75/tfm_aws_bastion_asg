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
  type        = "string"
  default     = "bastion_launch_config"
  description = "AutoScaling Launch Configuration Name"
}

variable "asg_name" {
  type        = "string"
  default     = "bastion_autoscaling_group"
  description = "AutoScaling Group Name"
}

variable "bastion_name" {
  type        = "string"
  default     = "bastion"
  description = "Bastion Instance Name"
}

variable "health_check_type" {
  type        = "string"
  default     = "EC2"
  description = "AutoScaling Health Check Type (EC2 or ELB)"
}

variable "subnet_ids" {
  type        = "string"
  description = "Comma separated list of VPC subnet IDs"
}

variable "azs" {
  type        = "string"
  // highly recommend using the subnet_ids variable instead
  default     = ""
  description = "Comma separated list of Availability Zones"
}

variable "user_data" {
  type        = "string"
  default     = ""
  description = "AutoScaling Launch Config UserData"
}
