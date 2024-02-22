#!/bin/bash

# Install Brew
if ! command -v brew &> /dev/null
then
  echo "Couldn't find brew, installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Brew already installed!"
fi

# Update brew
brew update && brew upgrade

# Install packages
brew install bat eza fzf raycast neovim ripgrep sesh stow tmux tree-sitter zoxide

# Stow the dotfiles
stow ~/dotfiles
