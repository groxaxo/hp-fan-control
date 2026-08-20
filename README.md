# HP 14s-dq2079tu Thermal Control

Thermald configuration and an installer for improving passive thermal
management on the HP 14s-dq2079tu laptop running Linux. The configuration
adjusts processor and fan cooling influence at 55 C, 65 C, and 75 C; it does
not directly implement a custom fan-control daemon.

## Important limitation

The `thermal-conf.xml` file uses Linux cooling-device indices such as `0`, `5`,
and `8`. Those indices can differ across kernels, firmware, and other laptop
models. Inspect the available thermal zones and cooling devices before using
this configuration, and do not apply it to another laptop without adapting it.

## Install

The installer requires root privileges, installs `thermald` if needed, copies
the configuration into `/etc/thermald/`, and restarts the service:

```bash
sudo ./install.sh
```

Review the file before installation if you have custom thermald settings. The
installer overwrites `/etc/thermald/thermal-conf.xml`.

## Monitor and troubleshoot

Install the sensor tools and inspect temperatures:

```bash
sudo apt-get install lm-sensors
sensors
sudo systemctl status thermald
sudo journalctl -u thermald
```

If the service rejects the configuration or the fan behavior does not improve,
restore the previous configuration and inspect the system's actual thermal-zone
and cooling-device mapping. This repository cannot guarantee fan behavior across
firmware revisions.

## Additional cooling measures

Keep the vents clean, use a stable cooling surface, update the BIOS when
appropriate, and consider TLP for power-management policy. These are separate
from this repository's thermald configuration.

## License

MIT. See [LICENSE](LICENSE).
