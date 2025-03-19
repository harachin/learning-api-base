# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Set environment variables
export EDITOR=vim
export PAGER=less

# Set prompt
PS1='\[\033[01;32m\]\u@\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set history options
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Load user-specific aliases and functions if available
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
