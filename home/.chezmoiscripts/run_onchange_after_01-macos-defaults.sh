#!/usr/bin/env bash
# chezmoi:run-on-change

set -euo pipefail

echo "Applying macOS system defaults..."

sudo --validate # Authenticate the user and extends the sudo timeout for another 5 minutes

# Enable /usr/lib/pam/pam_tid.so.2 for Touch ID authentication in `sudo`
# https://github.com/apple-oss-distributions/pam_modules/blob/main/modules/pam_tid/pam_tid.c
sudo tee /etc/pam.d/sudo_local << EOF > /dev/null
# sudo_local: local config file which survives system update and is included for sudo

# enable Touch ID authentication for sudo
auth       sufficient     pam_tid.so
EOF

## ----------------------------------------------------------------------------
# MARK: System Settings
# Updates System Settings ("/System/Applications/System Settings.app")
## ----------------------------------------------------------------------------

# region: System Settings

# ── Trackpad ──────────────────────────────────────────────────────────────────

# Natural scroll direction (false = traditional/disable natural)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Set "Secondary click" to "Click with Two Fingers"
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# ── Keyboard ──────────────────────────────────────────────────────────────────

# Disable press-and-hold for keys (enables key repeat)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ── Dock ──────────────────────────────────────────────────────────────────────

# Auto-hide the dock
defaults write com.apple.dock autohide -bool true

# Dock icon size (in points, typically 16–128)
defaults write com.apple.dock tilesize -int 44

# Magnification on/off
defaults write com.apple.dock magnification -bool true

# Magnification size (the magnified size when hovering)
defaults write com.apple.dock largesize -int 108

# Don't show recent apps in dock
defaults write com.apple.dock show-recents -bool false

# ── Finder ────────────────────────────────────────────────────────────────────

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# endregion

# ── Restart affected services ─────────────────────────────────────────────────

for app in "Finder" "Dock" "SystemUIServer"; do
  killall "${app}" &>/dev/null || true
done

echo "macOS defaults applied. Some changes may require a logout/restart."
