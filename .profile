#!/bin/bash

export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$(/usr/local/bin/pear config-get bin_dir):${PATH}"
export LANG="en_AU.UTF-8"

. "${HOME}/.bashrc"
export iOSOpenDevPath=/opt/iOSOpenDev
export iOSOpenDevDevice=192.168.1.130
export PATH=/opt/iOSOpenDev/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH

