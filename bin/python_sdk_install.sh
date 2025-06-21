#!/usr/bin/env bash

echo "Starting Python package installation..."

echo "Step 1: Installing Black (code formatter)..."
pip install black || { echo "Failed to install Black"; exit 1; }

echo "Step 2: Installing boto3 with CRT support..."
pip install 'boto3[crt]' || { echo "Failed to install boto3[crt]"; exit 1; }

echo "Step 3: Installing AWS CDK (Node)..."
sudo npm install -g aws-cdk

echo "Step 4: Installing AWS CDK (Python)..."
pip install aws-cdk.aws-codestar-alpha

echo "Python packages installed successfully."