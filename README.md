# .files
My personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

## Installation

```shell
# chezmoi needs a functional git client to clone the repo
xcode-select --install

/bin/sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply mwdiaz
```
