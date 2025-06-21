#!/usr/bin/env bash

echo "Starting AWS SAM CLI installation..."

AWS_SAM_ZIP="aws-sam-cli-linux-x86_64.zip"
AWS_SAM_DIR="sam-installation"
AWS_SAM_INSTALL_PATH="/usr/local/bin/sam"
TMPDIR=${TMPDIR:-/tmp}

# ---- AWS SAM CLI INSTALLATION ----
echo "Step 1: Downloading AWS SAM CLI zip package..."
sudo curl -s -L "https://github.com/aws/aws-sam-cli/releases/latest/download/$AWS_SAM_ZIP" -o "$AWS_SAM_ZIP" || { echo "Failed to download AWS SAM CLI"; exit 1; }

echo "Step 2: Unzipping AWS SAM CLI installer..."
sudo unzip -o -q "$AWS_SAM_ZIP" -d "$AWS_SAM_DIR" || { echo "Failed to unzip AWS SAM CLI installer"; exit 1; }

echo "Step 3: Installing AWS SAM CLI..."
sudo "./$AWS_SAM_DIR/install" || { echo "AWS SAM CLI installation failed"; exit 1; }

echo "Step 4: Cleaning up AWS SAM CLI files..."
sudo rm -rf "$AWS_SAM_ZIP" "$AWS_SAM_DIR"

echo "Step 5: Verifying AWS SAM CLI installation..."
if ! command -v sam &> /dev/null; then
    echo "AWS SAM CLI could not be found. Please check your installation."
    exit 1
fi

echo "AWS SAM CLI installed successfully."