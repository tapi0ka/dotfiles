#!/usr/bin/env bash
set -ue

#
# Docker Composeインストール
#

function check_root() {
  if [[ ${EUID:-${UID}} = 0 ]]; then
    :
  else
    echo "ルート権限で実行してください"
    exit 1
  fi
}

function main() {
  check_root

  apt update &&
    apt upgrade -y &&
    # jq: json加工 cat a.json | jq .
    # vim: エディタ
    # cron: 定期実行
    # python3-pip: pip3コマンドを利用する
    # python3-venv: venvコマンドを利用する
    apt install -y \
      jq \
      vim \
      cron \
      python3-pip \
      python3-venv

  # cronサービス起動
  systemctl enable cron && systemctl restart cron
}

main
