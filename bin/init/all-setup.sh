#!/bin/bash

# おまじないみたいなもの
SCRIPT_DIR=$(cd $(dirname $0); pwd)
. ${SCRIPT_DIR}/../common/function.sh # 共有関数取得

function main () {
  log "Start Init Shell"
  check_root
  . ${SCRIPT_DIR}/set-timezone.sh
  . ${SCRIPT_DIR}/set-gitconfig.sh
  . ${SCRIPT_DIR}/create-swap.sh
  log "End Init Shell"
}

main