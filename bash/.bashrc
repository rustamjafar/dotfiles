export BASH_SILENCE_DEPRECATION_WARNING=1

# set encoding
export LANG="en_US.UTF-8"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac;

# default editor
EDITOR="$(which vim)"

# editor for git
export GIT_EDITOR=vim

# set color formatters
start_color='e[38;5;'
end_format='e[0m'

# colors in tput format
RED=$(tput setaf 1)
ORANGE=$(tput setaf 202)
GREEN=$(tput setaf 2)
DEBIAN=$(tput setaf 52)
NORMAL=$(tput sgr0)

# this paths are for latex
PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH
INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH

# this path is for adb android tools
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# setting pATH
export PATHPREP="$HOME/cconda/bin:"
export PATHAPPEND=":$HOME/shared/bash/bin"
export PATH="$PATHPREP$PATH$PATHAPPEND"

# Setting CDPATH
#export CDPATH=


# checking if pwd is git repo
# to be refactored
# add check on pushing
git_branch() {
    gbranch=$(git branch --show-current 2> /dev/null)

    if [ -n "$gbranch" ] && [ -n "$(git status --porcelain)" ]; then
            echo -e " ${RED}b:$gbranch${NORMAL}"
    fi

    if [ -n "$gbranch" ] && [ -z "$(git status --porcelain)" ]; then
            echo -e " ${GREEN}b:$gbranch${NORMAL}"
    fi
}

# color hostname for easiness in multi-os env
# for now includes: ubuntu, debian
VERSION=$(sed -n 2p /etc/os-release)
case "${VERSION,,}" in
    *ubuntu* ) HOSTNAME="${ORANGE}${HOSTNAME}${NORMAL}" ;;
    *debian* ) HOSTNAME="${DEBIAN}${HOSTNAME}${NORMAL}" ;;
    *         ) ;;
esac

# prompt customization
PS1='╔ $SHLVL:$USER@$HOSTNAME in (${PWD//$HOME/\~}$(git_branch))\n╚ '

# Setting aliases
alias python='python3'
alias pip='pip3'
alias c='clear'
alias ls='ls -F'
alias la='ls -laF'
alias ll='ls -l'
alias tree='tree -L'

# Hitory
HISTCONTROL='ignoredups'
HISTTIMEFORMAT='%H%M%S%d%m%Y  '

# run lynx user config file
#LYNX_CFG=~/lynx.cfg

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/m7tkr/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/m7tkr/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/m7tkr/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/m7tkr/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

