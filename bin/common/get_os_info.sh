#!/bin/bash

# Copyright (c) 2016 Kohei Arao
# https://github.com/koara-local/dotfiles/edit/master/bin/get_os_info
# Released under the Unlicense
# http://unlicense.org/

# Get OS bit
# 32bit : i686
# 64bit : x86_64
get_os_bit() {
    echo $(uname -m);
}

# OSのディストリビューションを取得
get_os_distribution() {
  distri_name="unknown"
  if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
    # Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
        # Ubuntu
        distri_name="ubuntu"
    else
        # Debian
        distri_name="debian"
    fi
  fi
  echo ${distri_name}
}

# OS情報取得
get_os_info() {
   echo $(get_os_distribution) $(get_os_bit)
}