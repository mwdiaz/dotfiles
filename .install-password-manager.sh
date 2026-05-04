#!/bin/sh

. "$HOME"/.local/share/chezmoi/utils.sh

# Check if 'op' command already exists
if command -v op >/dev/null 2>&1; then
  echo "op command already exists"
  exit 0
fi