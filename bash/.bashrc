export BASH_SILENCE_DEPRECATION_WARNING=1

# set encoding
export LANG="en_US.UTF-8"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac;

# set color formatters
start_color='e[38;5;'
end_format='e[0m'
ORANGE=$(tput setaf 202)
NORMAL=$(tput sgr0)

# Setting PATH
export PATHAPPEND=:$HOME/m7tkr/bash/bin
export PATHPREP=
export PATH=$PATHPREP$PATH$PATHAPPEND

# Setting CDPATH
export CDPATH=$HOME/rsmn/:$HOME/

# Default editor
EDITOR="$(which vim)"

git_branch() {
    gbranch=$(git branch --show-current 2> /dev/null)
    if [ -n "$gbranch" ]; then
        echo -e "\e[38;5;124m b:$gbranch\e[0m"
    fi
}

if grep -iq 'name="ubuntu"' /etc/os-release 2>/dev/null; then
    HOSTNAME="${ORANGE}${HOSTNAME}${NORMAL}"
fi

# prompt customization
PS1='╔ $SHLVL:$USER@$HOSTNAME in (${PWD//$HOME/\~}$(git_branch)) \n╚ '

# Setting aliases
alias python='python3'
alias pip='pip3'
alias c='clear'
alias ls='ls -F'
alias la='ls -la'
alias portsrch='port search --name --glob'
alias sshd='sudo /usr/sbin/sshd -f ~/myserver/config'

# Hitory
HISTCONTROL='ignoredups'
HISTTIMEFORMAT='%H%M%S%d%m%Y  '

# lynx
LYNX_CFG=~/lynx.cfg
