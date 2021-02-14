#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run("sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to add 1Password apt repo key with rc={result.returncode}. Exiting.')
    sys.exit(1)

result=subprocess.run("echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to add 1Password apt repo with rc={result.returncode}. Exiting.')
    sys.exit(1)

result=subprocess.run("sudo apt update && sudo apt-get --yes install 1password",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to install 1Password with rc={result.returncode}. Exiting.')
    sys.exit(1)

sys.exit(0)
