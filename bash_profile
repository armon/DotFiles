export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=/usr/local/bin:$PATH
export LC_CTYPE=en_US.UTF-8
alias wget="curl -O"
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\u:\w$(__git_ps1 " (%s) ")\$ '
source /opt/local/etc/bash_completion.d/git-completion.bash
source ~/.profile
alias pyack="ack --type=python"

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git prettylog'
alias gcp='git cherry-pick'
alias gco='git checkout'

