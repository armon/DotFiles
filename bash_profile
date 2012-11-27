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
export EDITOR=vim

function sshkiip {
cd ~/projects/kiip/kiipweb;
HOST=`dig $1 | sed -n 's|.*A.*\(10\..*\)|\1|p'`
ssh -i .chef/kiip-ssh.pem -l ubuntu $HOST
}
export -f sshkiip

function cd {
    if [ -f "$1" ]
    then
        $EDITOR "$1"
    else
        builtin cd $@
    fi
}
export -f cd

