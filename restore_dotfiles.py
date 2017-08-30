#! /usr/bin/env python3

import os


ignore_files = ["README.md", ".gitignore", "restore_dotfiles.py", ".config"]
files = [f for f in os.listdir() if f not in ignore_files]
home_directory = os.path.expanduser("~")

print("Restoring the dotfiles ...")

for f in files:
    abspath_f = os.path.abspath(f)
    os.symlink(abspath_f, os.path.join(home_directory, f), target_is_directory=True)

os.symlink(".config/base16-shell", os.path.join(home_directory, ".config/base16-shell"), target_is_directory=True)
os.symlink(".config/terminator", os.path.join(home_directory, ".config/terminator"), target_is_directory=True)
os.symlink(".config/redshift.conf", os.path.join(home_directory, ".config/redshift.conf"))

print("Finished")
print("Do not forget to update the email address in the .gitconfig file")
