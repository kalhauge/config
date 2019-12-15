#!/usr/bin/python3.6
import re, subprocess
def get_keychain_pass(_file=None):
    return subprocess.check_output("gpg --quiet --for-your-eyes-only --no-tty --decrypt " + _file, shell=True)
