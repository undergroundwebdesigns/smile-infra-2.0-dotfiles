# Source main environment file
. ~/.env

# Return if not running interactively
[ -z "$PS1" ] && return

# need the host name set sometimes
[ -z "$HOSTNAME" ] && export HOSTNAME=$(hostname)

# Path setup for bash
export PATH="$PATH:/usr/local/MacGPG2/bin"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# no duplicates in history
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# Check window size after commands
shopt -s checkwinsize

# Let Ctrl-O work ing terminals
if [ -f /Applications ]; then
  stty discard undef
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

# Functions / Aliases
[ -f ~/.functions ] && . ~/.functions
[ -f ~/.aliases ] && . ~/.aliases

# Prompt
function __alexw_prompt {
  local EXIT="$?"
  local RED="\[\033[0;31m\]"
  local GREEN="\[\033[0;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local BLUE="\[\033[0;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local CYAN="\[\033[0;36m\]"

  local RESET="\[\033[0m\]"

  local USERNAME=""

  [[ "$SSH_CONNECTION" != '' ]] && USERNAME="${GREEN}\u${RESET}@${YELLOW}\h${RESET} "
  [[ $UID -eq 0 ]] && USERNAME="${RED}\u${RESET}@${YELLOW}\h${RESET} "

  local COLOR=$PURPLE
  if [ $EXIT != 0 ]; then
    COLOR=$RED
  fi

  export PS1="${BLUE}\w${RESET}\n${USERNAME}${COLOR}❯${RESET} "
  export PS2="${CYAN}❯${RESET} "
}

export PROMPT_COMMAND=__alexw_prompt

# chruby
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Don't check mail when opening terminal.
unset MAILCHECK

# Use gpg-agent in ssh-agent emulation mode and use it for SSH auth:
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
gpg --card-status | head -n1
