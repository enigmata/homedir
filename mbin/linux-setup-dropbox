#!/usr/bin/env python3

import subprocess
import sys

result=subprocess.run('cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -',shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to download and extract dropbox with rc={result.returncode}. Exiting.')
    sys.exit(1)

result=subprocess.run("cd ~; mkdir -p bin; cd bin; wget -O dropbox.py https://www.dropbox.com/download?dl=packages/dropbox.py; chmod +x dropbox.py",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to install the dropbox cmd-line utility with rc={result.returncode}. Exiting.')
    sys.exit(1)

result=subprocess.run("mkdir ~/Dropbox; cd ~/Dropbox; dropbox.py autostart y; dropbox.py start",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to start Dropbox daemon with rc={result.returncode}. Exiting.')
    sys.exit(1)

result=subprocess.run("dropbox.py exclude add 1Password/ apps/ audio/ books/ iTunes/ photos/ docs/ electronics/ finance/ fitness/ gaming/ geek/ graphics/ home/ refs_deprecated/",shell=True)
if result.returncode!=0:
    print(f'ERROR:  Failed to config sync-exclusions with rc={result.returncode}. Exiting.')
    sys.exit(1)

sys.exit(0)
