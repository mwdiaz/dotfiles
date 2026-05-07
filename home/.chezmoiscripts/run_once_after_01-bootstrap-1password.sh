#!/usr/bin/env zsh

set -euo pipefail

eval "$($BREW_EXE shellenv)"

echo "Installing 1Password, CLI, and GitHub CLI..."

brew install --cask 1password 1password-cli
brew install gh

echo "Opening 1Password..."
open -a "1Password"

echo "--------------------------------------------------------"
echo "  ACTION REQUIRED: ENABLE CLI INTEGRATION"
echo "--------------------------------------------------------"
echo "1. Sign into the 1Password App that just opened."
echo "2. Go to Settings > Developer."
echo "3. Check the box: 'Integrate with 1Password CLI'."
echo "--------------------------------------------------------"
read -k 1 "?Once you have checked that box, press any key here to continue..."
echo "\n"
