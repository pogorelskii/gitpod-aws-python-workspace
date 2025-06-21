#!/usr/bin/env bash

echo "Step 1: Updating package list and installing prerequisites..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo "Step 2: Downloading and adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Step 3: Verifying GPG key fingerprint..."
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "Step 4: Adding HashiCorp APT repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Step 5: Updating package list again to include HashiCorp repo..."
while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
  echo "Waiting for other apt process to finish..."
  sleep 2
done
sudo apt update

echo "Step 6: Installing Terraform..."
sudo apt-get install terraform

echo "Terraform installation completed."