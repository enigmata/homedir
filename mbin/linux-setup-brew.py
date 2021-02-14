#!/usr/bin/env python3

import os
from pathlib import Path
import subprocess
import sys

user=os.getenv('USER')

home_dir=Path(os.getenv('HOME'))
tmp_dir=home_dir/'tmp'
starting_dir=os.getcwd()

subprocess.run(["mkdir","-p",tmp_dir])

os.chdir(tmp_dir)

subprocess.run(["curl","-fsSLO","https://raw.githubusercontent.com/Homebrew/install/master/install.sh"])

subprocess.run(["chmod","+x","install.sh"])

subprocess.run(["./install.sh"])

subprocess.run(["rm","install.sh"])

os.chdir(starting_dir)

sys.exit(0)
