#!/usr/bin/env python3

import argparse
import subprocess
import sys

setup_modules=[['Passwordless sudo', 'linux-setup-sudo'],
               ['SSH', 'linux-setup-ssh'],
               ['Essential foundation', 'linux-setup-base'],
               ['Home Directory', 'linux-setup-homedir'],
               ['Homebrew', 'linux-setup-brew'],
               ['Homebrew taps', 'install-brew-taps'],
               ['Rust', 'linux-setup-rust'],
               ['Terminal', 'linux-setup-term'],
               ['Hack Font', 'linux-setup-hackfont'],
               ['1Password', 'linux-setup-1passwd'],
               ['Private config', 'linux-setup-privatecfg'],
               ['Cheatsheet', 'linux-setup-chtsh']]

def print_banner(phase_num: int, phase_text: str):
    banner_len=8+len(str(phase_num))+len(phase_text)
    print("%s" % '='*banner_len)
    print(f'PHASE {phase_num}: {phase_text}')
    print("%s" % '='*banner_len)

clp = argparse.ArgumentParser(prog='linux-setup',
                              description='Set up a virgin linux machine')

clp.add_argument('--bootstrap', action='store_true', help='copy this script to machine, then start setup')

clp.add_argument('--list', action='store_true', help='list the setup modules that can be installed')

args = clp.parse_args()

if args.list:
    for module in setup_modules:
        print(f'{module[0]:20}| {module[1]}')
    sys.exit(0)

if args.bootstrap:
    print("Option is not yet implemented: --bootstrap")
    sys.exit(0)

for mod_num, module in enumerate(setup_modules, start=1):
    print_banner(mod_num, module[0])
    try:
        result=subprocess.run(['./'+module[1]])
    except FileNotFoundError:
        print(f'WARNING: Module "{module[0]}" not found. Skipping ...')
        continue

    if result.returncode != 0:
        print(f'ERROR: Setup module failed with rc={result.returncode}')
    else:
        print("Setup completed successfuly")

print_banner(len(setup_modules)+1, 'Wrapping Up')

sys.exit(0)
