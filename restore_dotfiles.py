#! /usr/bin/env python3

import os
import shutil
import errno


ignore_files = [
    "README.md",
    ".git",
    ".gitignore",
    "restore_dotfiles.py",
    ".config",
    ".gitconfig",
]
files = [f for f in os.listdir() if f not in ignore_files]
files += [os.path.join(".config", f) for f in os.listdir(".config")]
home_directory = os.path.expanduser("~")

print("Restoring the dotfiles ...")

if not os.path.isdir(os.path.join(home_directory, ".config/autostart")):
    os.makedirs(os.path.join(home_directory, ".config/autostart"))

for f in files:
    abspath_source = os.path.abspath(f)
    print(abspath_source)
    abspath_dest = os.path.join(home_directory, f)
    try:
        os.symlink(abspath_source, abspath_dest, target_is_directory=True)
    except OSError as e:
        if e.errno == errno.EEXIST:
            if os.path.isdir(abspath_dest):
                if os.path.islink(abspath_dest):
                    os.unlink(abspath_dest)
                else:
                    shutil.rmtree(abspath_dest)
            else:
                os.remove(abspath_dest)
            os.symlink(abspath_source, abspath_dest, target_is_directory=True)
        else:
            raise e

os.system(
    "git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell"
)
try:
    shutil.copy2(".gitconfig", os.path.join(home_directory, ".gitconfig"))
    print("Do not forget to update the email address in the .gitconfig file")
except shutil.SameFileError:
    pass

print("Finished")
