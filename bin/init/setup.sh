#!/bin/bash

# 実行ディレクトリの絶対パスを取得
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. ${SCRIPT_DIR}/../common/func.sh

function main () {
  log "Start Init Shell"
  check_root
  . ${SCRIPT_DIR}/create-swap.sh
  log "End Init Shell"
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