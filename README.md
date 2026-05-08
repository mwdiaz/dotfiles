# .files

My personal macOS configuration and dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

## What are dotfiles?

Dotfiles are configuration files for command-line tools and applications (shell, git, editor settings, etc.). This repository enables quick setup of a new macOS machine with consistent development environment settings.

## What's included

This dotfiles repository manages the following configurations:

- **Shell**: Zsh and Oh My Zsh setup and configuration
- **Version Control**: Git configuration 
- **Editor**: EditorConfig settings and default VS Code extensions (managed using Homebrew)
- **SSH**: SSH keys (stored in 1Password) and configuration 
- **macOS**: Application and system defaults

## Requirements

- Modern macOS version
- git client

```shell
# Install the Xcode Command Line Tools in order to make default git client functional
xcode-select --install
```

## Installation

Run the following command to initialize and apply your dotfiles:

```shell
# This installs chezmoi and applies your dotfiles in one command
/bin/sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply mwdiaz
```

### What this does

1. Downloads and installs chezmoi to `$HOME/.local/bin`
2. Clones this repository to `~/.local/share/chezmoi`
3. Applies all configuration files to your home directory

## Usage

### Update your dotfiles

To pull the latest changes and apply them to your system:

```shell
chezmoi update
```

### Edit your dotfiles

To edit a dotfile and automatically apply changes:

```shell
chezmoi edit ~/.gitconfig
```

### View pending changes

To see what changes will be applied before applying them:

```shell
chezmoi diff
```

### Apply changes

After making edits, apply them to your home directory:

```shell
chezmoi apply
```

## Directory structure

```
.
├── home/                          # Files to be symlinked/copied to $HOME
│   ├── .chezmoi.toml.tmpl         # chezmoi configuration template
│   ├── .chezmoidata.toml          # Template data
│   ├── .chezmoiexternal.json      # External file management
│   ├── .chezmoiscripts/           # Scripts run during apply
│   ├── dot_config/                # ~/.config directory
│   ├── dot_editorconfig           # EditorConfig rules
│   ├── dot_gitconfig              # Git configuration
│   ├── dot_zshenv.tmpl            # Zsh environment (templated)
│   ├── private_dot_ssh/           # SSH config
│   └── private_Library/           # macOS application settings
├── .vscode/                       # VS Code settings and extensions specific to this repo
└── utils.sh                       # Utility scripts for setup
```

## License

[MIT License](LICENSE)

## References

- [chezmoi Documentation](https://www.chezmoi.io/)
- [chezmoi Quick Start](https://www.chezmoi.io/quick-start/)
