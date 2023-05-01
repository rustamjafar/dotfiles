export BASH_SILENCE_DEPRECATION_WARNING=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac;

# Setting PATH
export PATHAPPEND=":~/bin"
export PATHPREP="/opt/local/bin:/opt/local/sbin:"
export PATH="$PATHPREP$PATH$PATHAPPEND"

# Setting CDPATH
export CDPATH="$HOME/rsmn/:$HOME/:$HOME/tutorials/"

# Default editor
EDITOR="$(which vim)"

git_branch() {
    gbranch=$(git branch --show-current 2> /dev/null)
    if [ -n "$gbranch" ]; then
        echo " b:$gbranch"
    fi
}

# distroID="$(lsb_release -i)"
# noformat='e[0m'
# orange='e[38;5;202m'
#
# case "$distroID" in
#     *Ubuntu )
#         HOSTNAME="$orange$HOSTNAME$noformat" ;;
#     * ) ;;
# esac

# prompt customization
PS1='╔ $SHLVL:$USER@$HOSTNAME in (${PWD//$HOME/\~}$(git_branch)) \n╚ '

# Setting aliases
alias python='python3'
alias pip='pip3'
alias c='clear'
alias ls='ls -F'
alias la='ls -la'
alias portsrch='port search --name --line --glob'

# Hitory
HISTCONTROL='ignoredups'
HISTTIMEFORMAT='%H%M%S%d%m%Y  '

# lynx
LYNX_CFG=~/lynx.cfg
