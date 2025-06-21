#!/usr/bin/env bash

echo "Step 1: Verifying Git installation..."
if ! command -v git &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y git || { echo "Failed to install Git"; exit 1; }
fi

echo "Step 2: Setting Git user email..."
if [ -z "$GIT_USER_EMAIL" ]; then
    echo "Failed: GIT_USER_EMAIL environment variable not set"
    exit 1
fi
git config --global user.email "$GIT_USER_EMAIL" || { echo "Failed to set Git email"; exit 1; }

echo "Step 3: Setting Git user name..."
if [ -z "$GIT_USER_NAME" ]; then
    echo "Failed: GIT_USER_NAME environment variable not set"
    exit 1
fi
git config --global user.name "$GIT_USER_NAME" || { echo "Failed to set Git name"; exit 1; }