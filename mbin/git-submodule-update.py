#!/usr/bin/env python3

import argparse
import re
import subprocess
import os
import sys

clp = argparse.ArgumentParser(prog='git-submodule-update',
                              description='Update all submodules\' remote repos')

clp.add_argument('--init', action='store_true', help='only initialize submodules')

args = clp.parse_args()

if args.init:
   subprocess.run(["git", "submodule", "update", "--init"])
   sys.exit(0)

submod_result = subprocess.run(["git", "submodule", "update", "--remote"],
                               capture_output=True)

if submod_result.returncode != 0:
    print(f'ERROR: submodule update failed with rc={submod_result.returncode}')
    sys.exit(1)

if submod_result.stdout:
    submod_paths = re.findall(r"Submodule path '([-./a-zA-Z0-9]+)'",
                              submod_result.stdout.decode("utf-8"))
    if submod_paths:
        orig_dir = os.getcwd()
        for submod_path in submod_paths:
            print(f'\nUPDATING: {submod_path} ...\n')
            os.chdir(submod_path)
            subprocess.run(["git", "status"])
            subprocess.run(["git", "checkout", "master"])
            subprocess.run(["git", "pull"])
            os.chdir(orig_dir)
        print("\nupdate finished successfully\n")
        sys.exit(0)

print("INFO: No submodules need updating")
