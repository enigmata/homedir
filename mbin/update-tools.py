#!/usr/bin/env python3

from pathlib import Path
import os
import subprocess

print('\nUPDATE: npm packages...\n')
subprocess.run(["sudo","npm","-g","update"])

print('\nUPDATE: Rust ...\n')
subprocess.run(["rustup", "update"])

requirements_file=Path(os.environ["HOME"])/".config"/"python"/"requirements.txt"
print(f'\nUPDATE: Python packages ({requirements_file})...\n')
subprocess.run(["python3", "-m", "pip", "install", "-U", "-r", requirements_file])

print('\nUPDATE: Homebrew ...')
try:
    subprocess.run(["brew", "upgrade"])
except FileNotFoundError:
    print("Homebrew not installed; skipping ...")
print("\n")
