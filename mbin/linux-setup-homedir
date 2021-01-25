#!/usr/bin/env python3

import os
from pathlib import Path
import subprocess
import sys

user=os.getenv('USER')
owner=user+":"+user

home_dir=Path(os.getenv('HOME'))
src_dir=home_dir/'src'/'github.com'/'enigmata'
homedir_repo_dir=src_dir/'homedir'
pub_key_file=home_dir/'.ssh'/'id_rsa.pub'
mbin_dir=home_dir/'mbin'
starting_dir=os.getcwd()

subprocess.run(['ssh-keygen'])

print('Add the following SSH key to github:')
subprocess.run(["cat",pub_key_file])
print('\nContinue? ("y", or "n" to abort)')

response=input()
if response.upper()!="Y":
    print('Aborting')
    sys.exit(1)

subprocess.run(["mkdir","-p",src_dir])
os.chdir(src_dir)
subprocess.run(["git","clone","git@github.com:enigmata/homedir.git"])

os.chdir(homedir_repo_dir)
subprocess.run(["sudo","cp","-R",".",home_dir])

os.chdir(home_dir)
subprocess.run(["sudo","chown","-R",owner,"."])
subprocess.run(["rm",".profile"])

os.chdir(mbin_dir)
subprocess.run(["./git-submodule-update","--init"])

os.chdir(starting_dir)

sys.exit(0)
