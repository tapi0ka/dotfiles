#!/bin/bash
set -ue

# おまじないみたいなもの
SCRIPT_DIR=$(cd $(dirname $0); pwd)
. ${SCRIPT_DIR}/../common/function.sh # 共有関数取得
. ${SCRIPT_DIR}/../common/get_os_info.sh # 共有関数取得

function main() {
  check_root
  # OS情報取得
  os_info=($(get_os_info))

  case ${os_info[0]} in
  debian)
    timedatectl set-timezone Asia/Tokyo
    ;;
  ubuntu)
    set-timezone Asia/Tokyo
    ;;
  *)
    :
    ;;
  esac
}

main