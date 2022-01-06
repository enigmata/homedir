#!/usr/bin/env python3

import os
from pathlib import Path
import shutil
import subprocess
import sys

starting_dir=Path.cwd()
home_dir=Path.home()
packer_dir=home_dir / Path(".local/share/nvim/site/pack/packer/start/packer.nvim")

if not Path.exists(packer_dir):
    subprocess.run(["git","clone","--depth","1","https://github.com/wbthomason/packer.nvim",packer_dir])

sys.exit(0)
