Dotfiles for Alex Willemsma - alexw@smile.io.

_Most of the bootstrap functionality and much of the config shamelessly stolen from https://github.com/kelsin/dotfiles/blob/master/README.md_

## Goals

* Able to bootstrap a new Mac machine or Linux server easily with no
  dependencies other than `curl` or `wget`.
* Not having to keep entire home directory in git (as I used to do)
* Keeping external dependencies and custom scripts to a minimum

## Usage

### Bootstrapping

Dependencies: a [posix
sh](http://pubs.opengroup.org/onlinepubs/009695399/utilities/sh.html) and
[curl](https://curl.haxx.se/) or [wget](https://www.gnu.org/software/wget/)

On a mac laptop:

```sh
curl -o- https://raw.githubusercontent.com/undergroundwebdesigns/smile-infra-2.0-dotfiles/master/bootstrap | sh -s mac
```

On a server:
```sh
curl -o- https://raw.githubusercontent.com/undergroundwebdesigns/smile-infra-2.0-dotfiles/master/bootstrap | sh -s server
```

If you need to use wget the commands become:

```sh
wget -O - https://raw.githubusercontent.com/undergroundwebdesigns/smile-infra-2.0-dotfiles/master/bootstrap | sh mac
wget -O - https://raw.githubusercontent.com/undergroundwebdesigns/smile-infra-2.0-dotfiles/master/bootstrap | sh server
```

### Installing

The bootstrap will run an install initially for you, but at that point you can
easily remove or install packages yourself. There is a script available that
will setup the base mac or server package lists as well. Please note that if you
aren't in a terminal with `$STOW_DIR` set to `~/.dotfiles` (which is done by my
`~/.env` file) then you'll need to provide a `-d ~/.dotfiles` to all stow
commands.

```sh
# Install the bash package
stow bash

# Reinstall the bash package
# this removes old symlinks as well as places new ones
stow -R bash

# Remove the bash package
stow -D bash

# List packages (only in zsh)
# this is an alias in $DOTFILES/zsh/.zsh/aliases.zsh
packages

# Install mac packages (zsh script)
$DOTFILES/install mac

# Install server packages (zsh script)
$DOTFILES/install server
```

### Updating

Updating the dot files is as easy as running:

```sh
pushd $DOTFILES && git pull && popd
```

Updating all apple / brew / ruby and node packages on your machine can be done
by running:

```sh
update
```

Apple and brew updates are done all the time, ruby and node are only done if
those dotfile packages are currently stowed.
