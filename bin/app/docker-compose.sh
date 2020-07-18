#!/usr/bin/env bash
set -ue

#
# Docker Composeインストール
#

function main () {
  check_root
  compose_version=$(curl https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
  output='/usr/local/bin/docker-compose'
  curl -L https://github.com/docker/compose/releases/download/$compose_version/docker-compose-$(uname -s)-$(uname -m) -o $output
  chmod +x $output
  echo $(docker-compose --version)
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