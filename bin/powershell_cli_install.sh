#!/usr/bin/env bash

echo "Starting PowerShell installation..."

echo "Step 1: Updating package index..."
sudo apt-get update -y || { echo "Failed to update apt"; exit 1; }

echo "Step 2: Installing prerequisites..."
sudo apt-get install -y wget apt-transport-https software-properties-common || { echo "Failed to install prerequisites"; exit 1; }

echo "Step 3: Importing Microsoft GPG key..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - || { echo "Failed to add Microsoft GPG key"; exit 1; }

echo "Step 4: Registering Microsoft APT repository..."
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-jammy-prod jammy main" > /etc/apt/sources.list.d/microsoft.list' || { echo "Failed to add Microsoft repo"; exit 1; }

echo "Step 5: Updating package index (again)..."
while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
  echo "Waiting for other apt process to finish..."
  sleep 2
done
sudo apt-get update -y || { echo "Failed to update after adding repo"; exit 1; }

echo "Step 6: Installing PowerShell..."
sudo apt-get install -y powershell || { echo "Failed to install PowerShell"; exit 1; }

echo "Step 7: Verifying PowerShell installation..."
if ! command -v pwsh &> /dev/null; then
    echo "PowerShell not found after install"
    exit 1
fi

echo "Step 8: Installing AWS Tools for PowerShell..."
pwsh -Command 'Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; Install-Module -Name AWS.Tools.Installer -Force; Install-AWSToolsModule AWS.Tools.Common,AWS.Tools.S3 -CleanUp -Force' || { echo "Failed to install AWS Tools for PowerShell"; exit 1; }

echo "PowerShell and AWS Tools for PowerShell installed successfully."
