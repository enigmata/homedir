#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run('cd ~; ln -sf ~/Dropbox/computing/devices/mine/config/.private .',shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to link in the private cfg with rc={result.returncode}. Exiting.')
    sys.exit(1)

sys.exit(0)
