# Use gpg-agent in ssh-agent emulation mode and use it for SSH auth:
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
gpg --card-status | head n1
