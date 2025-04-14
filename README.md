# HP 14s-dq2079tu Fan Control

This repository contains configuration files and instructions for improving thermal management and fan control on the HP 14s-dq2079tu laptop running Linux.

## Problem

The HP 14s-dq2079tu laptop may experience issues with fan control under Linux, leading to high CPU temperatures and thermal throttling.

## Solution

We've created a custom thermal configuration file for the `thermald` daemon that helps manage CPU temperatures by:

1. Setting appropriate temperature thresholds for the CPU
2. Controlling CPU throttling to manage heat generation
3. Indirectly influencing fan behavior through temperature management

## Files

- `thermal-conf.xml`: Custom configuration file for thermald with temperature thresholds at 55°C, 65°C, and 75°C
- `install.sh`: Installation script to set up the configuration

## Installation

1. Install thermald if not already installed:
   ```
   sudo apt-get update
   sudo apt-get install -y thermald
   ```

2. Copy the configuration file:
   ```
   sudo mkdir -p /etc/thermald
   sudo cp thermal-conf.xml /etc/thermald/
   ```

3. Restart thermald:
   ```
   sudo systemctl restart thermald
   ```

## Monitoring

You can monitor your CPU temperature using the `sensors` command:
```
sensors
```

## Additional Recommendations

1. Use a laptop cooling pad for better airflow
2. Clean your laptop's vents regularly
3. Update your BIOS to the latest version
4. Consider repasting the CPU if temperatures remain high
5. Install TLP for better power management:
   ```
   sudo apt-get install tlp
   sudo systemctl enable tlp
   sudo systemctl start tlp
   ```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
