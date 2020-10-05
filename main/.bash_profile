alias inf-live="cd $CODE_PATH/smile-infrastructure/infrastructure-live"
alias inf-mod="cd $CODE_PATH/smile-infrastructure/infrastructure-modules"
alias fr="foreman run"

# Use gpg-agent in ssh-agent emulation mode and use it for SSH auth:
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

# Don't check mail when opening terminal.
unset MAILCHECK
