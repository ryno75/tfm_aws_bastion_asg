#!/bin/bash

# Associate EIP
export INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
export AWS_DEFAULT_REGION=${aws_region}
aws ec2 associate-address --instance-id $${INSTANCE_ID} --allocation-id ${eip_id} --allow-reassociation

# install reqs
yum install -y python-pip
pip install --upgrade awscli
pip install --upgrade boto
