#!/usr/bin/env bash

echo "Starting AWS CLI installation and login process..."

AWS_CLI_ZIP="awsliv2.zip"
AWS_INSTALLER_DIR="aws"
AWS_V2_INSTALL_PATH="/usr/local/aws-cli/v2/current"
TMPDIR=${TMPDIR:-/tmp}

echo "Step 1: Creating temporary installation directory..."
mkdir -p "$TMPDIR/awscli_install"
cd "$TMPDIR/awscli_install" || { echo "❌ Failed to cd into temp directory"; exit 1; }

echo "Step 2: Downloading AWS CLI zip package..."
sudo curl -s -f "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$AWS_CLI_ZIP" || { echo "❌ Failed to download AWS CLI"; exit 1; }

echo "Step 3: Unzipping AWS CLI installer..."
sudo unzip -o -q "$AWS_CLI_ZIP" || { echo "❌ Failed to unzip AWS CLI installer"; exit 1; }

echo "Step 4: Running AWS CLI installer with update (retry on failure)..."
sudo "./$AWS_INSTALLER_DIR/install" --update

echo "Step 5: Cleaning up installation files..."
sudo rm -rf "$AWS_CLI_ZIP" "$AWS_INSTALLER_DIR"

echo "Step 6: Verifying AWS CLI installation..."
if ! command -v aws &> /dev/null; then
    echo "AWS CLI could not be found. Please install it first."
    exit 1
fi

echo "Step 7: Configuring AWS CLI credentials..."
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_DEFAULT_REGION"

echo "AWS CLI setup and login process completed successfully."