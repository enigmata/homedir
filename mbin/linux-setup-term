#!/usr/bin/env python3

import os
import subprocess
import sys

cargo_bin=os.getenv('HOME') + '/.cargo/bin'
os.environ['PATH']=cargo_bin+':'+os.environ['PATH']
os.environ['PKG_CONFIG_PATH']='/home/linuxbrew/.linuxbrew/lib/pkgconfig'

result = subprocess.run(['cargo','install','alacritty'],env=os.environ)

if result.returncode != 0:
    print('Installation failed')
    sys.exit(1)

print('Installation was successful')

sys.exit(0)
