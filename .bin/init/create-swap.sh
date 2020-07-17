#!/usr/bin/env bash
set -ue

function main() {
  # root権限チェック
  check_root
  if grep 'swapfile' /etc/fstab >/dev/null; then
    echo "すでにswap領域が存在するので終了します"
    return
  fi
  make_swap
}

function check_root() {
  if [[ ${EUID:-${UID}} = 0 ]]; then
    :
  else
    echo "ルート権限で実行してください"
    exit 1
  fi
}

function make_swap() {
  # 3GB分のswapファイル作成
  dd if=/dev/zero of=/swapfile bs=1M count=3072
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile swap swap defaults 0 0" >>/etc/fstab
  free -m
}

main
