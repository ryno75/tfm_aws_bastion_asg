#!/bin/bash

# Associate EIP
export INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
export AWS_DEFAULT_REGION=${aws_region}
aws ec2 associate-address --instance-id $INSTANCE_ID --allocation-id ${eip_id} --allow-reassociation

# sleep 15 seconds to give networking a little time to come up
sleep 15

# Insert any optional passed in userdata here...
${suffix}
