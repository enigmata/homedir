#!/usr/bin/env python3

import argparse
import os
import subprocess
import sys

brew_tap_install_cmd = ["brew","install"]
tap_install_list = ['bash','bat','bottom','broot','btop','cheat','cmake','cppman','dasel','difftastic','dog','dos2unix','duf','dust','exa','fd','fennel','fontconfig','fzf','gcc','git','git-delta','git-filter-repo','glances','go','gotop','httpie','hyperfine','hexyl','llvm','neovim','neofetch','nnn','node','pkg-config','python@3.9','rg','rlwrap','rust-analyzer','sd','ssh-copy-id','the_silver_searcher','tmux','vim','wget']

clp = argparse.ArgumentParser(prog='install-brew',
                              description='Install default set of homebrew taps/casks')

clp.add_argument('--list', action='store_true', help='list, do not install, default set of taps/casks')

args = clp.parse_args()

print("\nDefault homebrew taps/casks:")
print(' ', *tap_install_list, sep='\n ')

if args.list:
   sys.exit(0)

print("\nInstalling ...\n")

os.environ["PATH"]='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:'+os.environ["PATH"]

try:
    install_result = subprocess.run(brew_tap_install_cmd + tap_install_list,env=os.environ)
except FileNotFoundError:
    print("ERROR: homebrew is not installed, or not in the \$PATH")
    print('Aborting installation')
    sys.exit(1)

if install_result.returncode != 0:
    print('Installation failed')
    sys.exit(1)

print('Installation was successful')

sys.exit(0)
