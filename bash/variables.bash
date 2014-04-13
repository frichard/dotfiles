
export DOTFILES=$HOME/dotfiles

umask 22
ulimit -c 0

paths() {
  env | grep PATH
}

# prepend_colon(val, var)
prepend_colon() {
  if [ -z "$2" ]; then
    echo $1
  else
    echo $1:$2
  fi
}

# unshift_path(path)
unshift_path() {
  if [ -d $1/sbin ]; then
    export PATH=$(prepend_colon "$1/sbin" $PATH)
  fi
  if [ -d $1/bin ]; then
    export PATH=$(prepend_colon "$1/bin" $PATH)
  fi

  if [ -d $1/share/man ]; then
    export MANPATH=$(prepend_colon "$1/share/man" $MANPATH)
  fi
}

# TABULA RASA
export PATH=""
export MANPATH=""

unshift_path "/usr/X11"
unshift_path ""
unshift_path "/usr"
unshift_path "/usr/local"
unshift_path "/usr/local/go"
unshift_path "/Users/frichard/practice/gradle-1.11"
unshift_path "/opt/local"
unshift_path "$HOME/local"
unshift_path "$DOTFILES"

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ACK_COLOR_FILENAME="cyan"
export ACK_COLOR_MATCH="bold red"

# Re-enable colors at the terminal level for ls
export CLICOLOR=1
export TERM=xterm-256color

# Setup the GOROOT for GoLang
export GOROOT="/usr/local/go"
# Setup of the GOPATH for GoLang
export GOPATH="$HOME/work/golang"
unshift_path "$GOPATH"
# Update the PATH to support ylinux
export PATH=$(prepend_colon "/home/y/bin" $PATH)
export PATH=$(prepend_colon "/home/y/bin64" $PATH)

# Update the PATH to support Mono build for Yahoo
unshift_path /home/y/share/mono-2.10

export PATH=$(prepend_colon ".local" $PATH)
