#!/usr/bin/env bash

echo "Configuring AWS CLI credentials..."

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_DEFAULT_REGION"

echo "AWS credentials configuration process completed successfully."