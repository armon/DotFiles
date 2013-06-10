export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=~/bin:/usr/local/bin:/Developer/NVIDIA/CUDA-5.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:$DYLD_LIBRARY_PATH
export LC_CTYPE=en_US.UTF-8
alias wget="curl -O"
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\u:\w$(__git_ps1 " (%s) ")\$ '
source /usr/local/etc/bash_completion.d/*
. /usr/local/etc/bash_completion.d/git-completion.bash
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

function resolvekiip {
    HOST=`dig $1 | sed -n 's|.*A.*\(10\..*\)|\1|p'`
    echo $HOST
}
export -f resolvekiip

function sshkiip {
cd ~/projects/kiip/kiipweb;
HOST=`dig $1 | sed -n 's|.*A.*\(10\..*\)|\1|p'`
ssh -i .chef/kiip-ssh.pem -l ubuntu $HOST ${@:2}
}
export -f sshkiip


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Use VMware Fusion by default
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

export GOROOT=$HOME/go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

