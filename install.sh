#!/bin/bash

# HP 14s-dq2079tu Fan Control Installation Script

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Install thermald if not already installed
echo "Checking for thermald..."
if ! command -v thermald &> /dev/null; then
    echo "Installing thermald..."
    apt-get update
    apt-get install -y thermald
else
    echo "thermald is already installed."
fi

# Create directory if it doesn't exist
echo "Creating configuration directory..."
mkdir -p /etc/thermald

# Copy configuration file
echo "Installing thermal configuration file..."
cp thermal-conf.xml /etc/thermald/

# Restart thermald
echo "Restarting thermald service..."
systemctl restart thermald

# Check status
echo "Checking thermald status..."
systemctl status thermald

echo ""
echo "Installation complete!"
echo "You can monitor temperatures with the 'sensors' command."
echo ""
echo "For better power management, consider installing TLP:"
echo "sudo apt-get install tlp"
echo "sudo systemctl enable tlp"
echo "sudo systemctl start tlp"
