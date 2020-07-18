#!/bin/bash

readonly PROCNAME=${0##*/}
readonly LOGFILE="/tmp/${0##*/}.log"

function log() {
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@" | tee -a ${LOGFILE}
}

# 実行ユーザがルート権限かを確認する
# ルート権限ではない場合シェル終了
function check_root() {
  if [[ ${EUID:-${UID}} = 0 ]]; then
    :
  else
    echo "ルート権限で実行してください"
    exit 1
  fi
}
