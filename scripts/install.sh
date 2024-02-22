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
brew install bat eza fzf raycast neovim ripgrep joshmedeski/sesh/sesh stow tmux tree-sitter zoxide

# Configured fonts
curl -JLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir font
unzip JetBrainsMono.zip -d font
cp ./font/*.ttf ~/Library/Fonts/
rm -rf font
rm JetBrainsMono.zip

# Install TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Stow the dotfiles
cd ~/dotfiles
stow .
