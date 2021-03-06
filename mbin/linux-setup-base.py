#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run(["sudo", "apt-get", "update"])
if result.returncode != 0:
    print(f'ERROR: Apt update failed with rc={result.returncode}! Exiting')
    sys.exit(1)

apt_packages=["curl","git","build-essential","libxcb-util-dev","libxcb-render0-dev","libxcb-shape0-dev","libxcb-xfixes0-dev","gnome-tweaks"]
result=subprocess.run(["sudo", "apt-get", "--yes", "install"]+apt_packages)
if result.returncode != 0:
    print(f'ERROR: Install failed with rc={result.returncode}!')
    sys.exit(1)

print("Base package was installed successfully")
sys.exit(0)
