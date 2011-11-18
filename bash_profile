export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=~/bin:/usr/local/bin:$PATH
export LC_CTYPE=en_US.UTF-8
alias wget="curl -O"
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\u:\w$(__git_ps1 " (%s) ")\$ '
source /usr/local/etc/bash_completion.d/*
alias pyack="ack --type=python"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpu='git update'
alias gl='git prettylog'
alias gd='git cdiff'
alias gcp='git cherry-pick'
alias gco='git checkout'

