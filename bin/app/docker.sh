#!/usr/bin/env bash
set -u

#
# Dockerインストール
#

function check_root() {
  if [[ ${EUID:-${UID}} = 0 ]]; then
    :
  else
    echo "ルート権限で実行してください"
    exit 1
  fi
}

function main () {
  # check_root

  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  # グループ作成（多分すでに作成済）
  groupadd docker
  # sudoしているユーザをdockerグループに追加
  # ubuntuの場合
  # usermod -aG docker ${SUDO_USER:-$USER}
  # Debianの場合
  gpasswd -a ${SUDO_USER:-$USER} docker
  # システム起動時にdockerサービスが起動するように設定
  systemctl enable docker.service

  rm -f get-docker.sh

  # インスタンスの再起動を行わないとsudoなしでdockerコマンドが使えない
}

main