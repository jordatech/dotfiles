#!/usr/bin/env bash
#Author:    Jordan Ulmer
#Date:      2016-12-31
#Purpose:   setup linux environment 
#Ubuntu mate.bashrc

echo "sourcing mate.bashrc"
#############
## EXPORTS ##
#############

# shortcut to dotfiles path
export DOTFILES=$HOME/.dotfiles

### ENV Vars
if [[ -f $DOTFILES/system/env ]]; then
    source $DOTFILES/system/env
fi

#############
## Aliases ##
#############

### git
if [ -f $DOTFILES/git/gitaliases ]; then
    source $DOTFILES/git/gitaliases
fi
### bash
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
### sys aliases
if [[ -f $DOTFILES/system/sysaliases ]]; then
    source $DOTFILES/system/sysaliases
fi

### Source other files
### paths
if [[ -f $DOTFILES/system/path ]]; then
    source $DOTFILES/system/path
fi
### autocomplete
if [[ -f $DOTFILES/bash/git_alias_completion.bash ]]; then
  source $DOTFILES/bash/git_alias_completion.bash
fi
### HIPE Project
if [[ -f $DOTFILES/proj/profile.hipe ]]; then
  source $DOTFILES/proj/profile.hipe
fi

### bash
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

#############
## history ##
#############

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


####################
## shopt commands ##
####################

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


###########
## THEME ##
###########

### bash_prompt
if [[ -f $DOTFILES/bash/bash_prompt ]]; then
  source $DOTFILES/bash/bash_prompt
fi
