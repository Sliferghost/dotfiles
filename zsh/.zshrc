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
alias lg="lazygit"
alias copy-username="lpass show --clip --username -F"
alias copy-password="lpass show --clip --password -F"
alias cc="claude"

# Custom functions
function tesla-unzip() {
  if [[ -z "$1" ]]; then
    echo "Usage: tesla-unzip <zipfile>"
    return 1
  fi

  local zipfile="$1"
  if [[ ! -f "$zipfile" ]]; then
    echo "Error: File '$zipfile' not found"
    return 1
  fi

  local tmpdir=$(mktemp -d)
  unzip -q "$zipfile" -d "$tmpdir"

  local count=$(find "$tmpdir" -type f -name "*.pdf" | wc -l | tr -d ' ')
  find "$tmpdir" -type f -name "*.pdf" -exec mv {} . \;

  rm -rf "$tmpdir"
  echo "Extracted $count invoice(s) to current directory"
}

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

# UV - Python environment
[[ -s "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/jaapoudejans/.bun/_bun" ] && source "/Users/jaapoudejans/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# AsyncAPI CLI Autocomplete
ASYNCAPI_AC_ZSH_SETUP_PATH=/Users/jaapoudejans/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup

# >>> chisel >>>
# Managed by chisel. Do not edit manually.
export PATH="/Users/jaapoudejans/.chisel/bin:$PATH"
export PATH="/Users/jaapoudejans/.chisel/google-cloud-sdk/bin:$PATH"
export JIRA_CONFIG_FILE="/Users/jaapoudejans/.chisel/jira-config.yml"
export JIRA_API_TOKEN="$(security find-generic-password -s 'chisel/jira-api-token' -a "$USER" -w 2>/dev/null)"
export CONFLUENCE_API_TOKEN="$(security find-generic-password -s 'chisel/confluence-api-token' -a "$USER" -w 2>/dev/null)"
export JF_ACCESS_TOKEN="$(security find-generic-password -s 'chisel/jfrog-access-token' -a "$USER" -w 2>/dev/null)"
export INTER_CONFLUENCE_API_TOKEN="$(security find-generic-password -s 'chisel/inter-confluence-api-token' -a "$USER" -w 2>/dev/null)"
command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"
command -v cs &>/dev/null && _cs_jh="$(cs java-home --jvm temurin:21 2>/dev/null)" && [ -n "$_cs_jh" ] && export JAVA_HOME="$_cs_jh"
copilot() {
  chisel skills sync --if-stale 24h >/dev/null 2>&1 || true
  command copilot "$@"
}
# <<< chisel <<<
