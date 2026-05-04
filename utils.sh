#!/bin/sh

is_ubuntu() {
  if [ -f /etc/os-release ]; then
    grep -q "^ID=ubuntu" /etc/os-release
    return $?
  fi

  return 1
}

is_macos() {
  [ "$(uname -s)" = "Darwin" ]
}