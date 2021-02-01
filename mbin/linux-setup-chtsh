#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run('sudo apt install rlwrap',shell=True)
result=subprocess.run('curl https://cht.sh/:cht.sh > ~/mbin/cht.sh',shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to download cheat sheet with rc={result.returncode}. Exiting.')
    sys.exit(1)

sys.exit(0)
