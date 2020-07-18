#!/bin/bash
set -eu

# 実行ディレクトリの絶対パスを取得
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# 共通関数取得
. ${SCRIPT_DIR}/../common/function.sh

function main () {
  log "Start Init Shell"
  check_root
  . ${SCRIPT_DIR}/create-swap.sh
  log "End Init Shell"
}

main