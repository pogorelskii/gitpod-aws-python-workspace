# Gitpod Configuration for AWS CLI and Boto3

This project contains a Gitpod configuration to set up the AWS CLI and AWS SDK for Python (`boto3`) in your development environment.

## Prerequisites

To use this setup, you need to add the following secrets to your Gitpod user settings:

- `AWS_ACCESS_KEY_ID`  
- `AWS_SECRET_ACCESS_KEY`  
- `AWS_DEFAULT_REGION`  
- `GIT_USER_EMAIL`  
- `GIT_USER_NAME`  

These secrets enable authentication with AWS services and configure Git user information.

## Features

- Installs and configures AWS CLI automatically
- Installs Python packages including boto3 for AWS SDK usage
- Installs Terraform and AWS CDK for infrastructure-as-code workflows
- Provides a ready-to-use environment for AWS development with Python and IaC tools

## Usage

1. Add the required secrets to your Gitpod user settings.  
2. Start the Gitpod workspace. The setup tasks will run automatically.  
3. Begin developing your AWS-based Python applications.

---

If you need help with adding secrets or configuring Gitpod, please refer to the [Gitpod documentation](https://www.gitpod.io/docs/config-environment-variables/).
