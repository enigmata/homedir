#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run(["sudo", "apt-get", "update"])
if result.returncode != 0:
    print(f'ERROR: Update failed with rc={result.returncode}! Exiting')
    sys.exit(1)

result=subprocess.run(["sudo", "apt-get", "--yes", "install", "ssh"])
if result.returncode != 0:
    print(f'ERROR: SSH install failed with rc={result.returncode}!')
    sys.exit(1)

print("SSH package was installed successfully")
sys.exit(0)
