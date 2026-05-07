#!/usr/bin/env bash

set -euo pipefail

if xcode-select -p &> /dev/null; then
  echo "✅ Xcode command line tools already installed."
else
  echo "Installing Xcode command line tools..."

  # Triggers GUI that requires interaction
  xcode-select --install

  echo -n "⏳ Waiting for Xcode command line tools installation to finish."

  until xcode-select -p &> /dev/null; do
    printf "."
    sleep 5
  done

  printf "\n✅ Xcode command line tools are already installed."
fi
