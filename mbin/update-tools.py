#!/usr/bin/env python3

import subprocess

print('\nUPDATE: Submodules...\n')
subprocess.run(["git-submodule-update"])

print('\nUPDATE: Rust ...\n')
subprocess.run(["rustup", "update"])

print('\nUPDATE: Homebrew ...\n')
subprocess.run(["brew", "upgrade"])
