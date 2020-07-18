#!/bin/bash
set -ue

# おまじないみたいなもの
SCRIPT_DIR=$(cd $(dirname $0); pwd)
. ${SCRIPT_DIR}/../common/function.sh # 共有関数取得
. ${SCRIPT_DIR}/../common/get_os_info.sh # 共有関数取得

function main() {
  read -p "your git name is?" name
  sudo -u ${SUDO_USER:-$USER} git config --global user.name ${name}
  read -p "your git email is?" email
  sudo -u ${SUDO_USER:-$USER} git config --global user.email ${email}

  # commit時のデフォルトエディタを変更
  sudo -u ${SUDO_USER:-$USER} git config --global core.editor 'vim -c "set fenc=utf-8"'

  log "Git Setting Complete!"
}

main