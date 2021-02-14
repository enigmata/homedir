#!/usr/bin/env python3

import os
from pathlib import Path
import subprocess
import sys

user=os.getenv('USER')

home_dir=os.getenv('HOME')
bin_dir=home_dir+'/bin'
cargo_config=home_dir+'/.cargo/config.toml'

config_toml="""
[install]
root = '"""+home_dir+"""'
[term]
verbose = false
color = 'auto'
progress.when = 'auto'
progress.width = 80
"""

result=subprocess.run("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh",shell=True)

if result.returncode!=0:
    print(f'ERROR:  rustup install failed with rc={result.returncode}. Exiting.')
    sys.exit(1)

with open(cargo_config, "w") as cfg:
    cfg.seek(0)
    cfg.write(config_toml)
    cfg.truncate()

os.mkdir(bin_dir)

sys.exit(0)
