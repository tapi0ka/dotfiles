#!/bin/bash

# 実行ディレクトリの絶対パスを取得
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. ${SCRIPT_DIR}/../common/function.sh

function main () {
  log "Start App Setup."
  check_root

  . ${SCRIPT_DIR}/apt.sh
  . ${SCRIPT_DIR}/docker.sh
  . ${SCRIPT_DIR}/docker-compose.sh

  log "End App Setup."
}

function check_root() {
  if [[ ${EUID:-${UID}} = 0 ]]; then
    :
  else
    echo "ルート権限で実行してください"
    exit 1
  fi
}

main