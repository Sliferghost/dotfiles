# ------------------ History ------------------
# Set the path to the history file
HISTFILE=~/.zsh_history
# Set the number of commands to save in the history file
SAVEHIST=10000
# Set the number of commands to save in the current shell session
HISTSIZE=10000
# Append to history, don't overwrite
setopt APPEND_HISTORY
# Share history between all sessions
setopt SHARE_HISTORY
# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# Don't record duplicates
setopt HIST_IGNORE_DUPS
# Don't record commands starting with a space
setopt HIST_IGNORE_SPACE

# Completions
autoload -U compinit
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.cache/zsh/completions
compinit

#Aliases
alias n="nvim"
alias ls="eza"
alias l="eza -alh"
alias tree="eza --tree"
alias cat="bat"
alias cd="z"
alias lg="lazygit"
alias copy-username="lpass show --clip --username -F"
alias copy-password="lpass show --clip --password -F"

# Environment
export EDITOR="nvim"

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# FZF
source ~/.config/fzf/themes/catppuccin-fzf-mocha.sh

# Auto suggest cli commands
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

