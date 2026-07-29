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

# Prune local branches whose upstream remote branch was deleted (e.g. after PR merge)
git-prune-branches() {
  # Ensure we're inside a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not a git repository." >&2
    return 1
  fi

  # Update remote tracking refs and drop stale ones
  git fetch --prune

  local current gone
  current=$(git branch --show-current)

  # Local branches whose tracked upstream is gone, excluding the current branch
  gone=$(git branch -vv | grep ': gone]' | awk '{print $1}' | grep -vx "$current")

  if [[ -z "$gone" ]]; then
    echo "No stale branches to clean up."
    return 0
  fi

  echo "The following stale branches will be deleted:"
  echo "$gone" | sed 's/^/  /'

  # Confirm before deleting (skip prompt with -y/--yes)
  if [[ "$1" != "-y" && "$1" != "--yes" ]]; then
    echo -n "Delete these branches? [y/N] "
    read -r reply
    [[ "$reply" == [yY] ]] || { echo "Aborted."; return 0; }
  fi

  echo "$gone" | xargs git branch -D
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

# AsyncAPI CLI Autocomplete
ASYNCAPI_AC_ZSH_SETUP_PATH=/Users/jaapoudejans/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup

# >>> chisel >>>
# Managed by chisel. Do not edit manually.
export PATH="/Users/jaapoudejans/.chisel/bin:$PATH"
export PATH="/Users/jaapoudejans/.chisel/google-cloud-sdk/bin:$PATH"
export CLOUDSDK_PYTHON="/Users/jaapoudejans/.chisel/gcloud-python"
export JIRA_API_TOKEN="$(security find-generic-password -s 'chisel/jira-api-token' -a "$USER" -w 2>/dev/null)"
export CONFLUENCE_API_TOKEN="$(security find-generic-password -s 'chisel/confluence-api-token' -a "$USER" -w 2>/dev/null)"
export JF_ACCESS_TOKEN="$(security find-generic-password -s 'chisel/jfrog-access-token' -a "$USER" -w 2>/dev/null)"
export INTER_CONFLUENCE_API_TOKEN="$(security find-generic-password -s 'chisel/inter-confluence-api-token' -a "$USER" -w 2>/dev/null)"
command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"
command -v cs &>/dev/null && _cs_jh="$(cs java-home --jvm temurin:25 2>/dev/null)" && [ -n "$_cs_jh" ] && export JAVA_HOME="$_cs_jh"
copilot() {
  if [ "${COPILOT_NO_MEMORIES+x}" ]; then
    command copilot "$@"
  else
    COPILOT_CUSTOM_INSTRUCTIONS_DIRS="/Users/jaapoudejans/.chisel/memories/inbound" command copilot "$@"
  fi
}
# <<< chisel <<<

# Docker & Colima
alias colima-start="colima start --cpu 4 --memory 8 --network-address"
if command -v colima >/dev/null && colima status >/dev/null 2>&1; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
  export TESTCONTAINERS_HOST_OVERRIDE="$(colima ls -j | jq -r '.address')"
fi

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"
