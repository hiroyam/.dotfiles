#
# Env
#
#{{{
[ -t 0 ] && stty stop undef
export PATH=./bin:~/.local/sbin:~/.local/bin:/usr/local/sbin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=./lib:~/.local/lib:~/.local/lib64:/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH #cuda
export MANPATH=~/.local/share/man:/usr/local/share/man:$MANPATH
export CPATH=/usr/local/include:$CPATH
# export PYTHONPATH=~/.pyenv/versions/anaconda3-4.1.0/lib/python3.5/site-packages:$PYTHONPATH
export LANG='ja_JP.UTF-8'
export LISTMAX=200
export HISTSIZE='100000'
export EDITOR='vi'
export PAGER='less'
export IGNOREEOF=3
export GREP_COLOR='1;36'
export PS1='\[\033[1;32m\]\u@\h\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\] \[\033[1;31m\]$(__git_ps1 "(%s)")\[\033[0m\] \$ '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# http://x.cygwin.com/docs/ug/using-remote-apps.html
# http://vega.sra-tohoku.co.jp/~kabe/vsd/ssh-x.html
case "${OSTYPE}" in
darwin* | cygwin*) export DISPLAY=:0.0 ;;
esac

#}}}


#
# Alias
#
#{{{

alias grep='grep -EI --color=auto --exclude-dir={.svn,.git,.hg}'
alias diff='diff -wB'

# docker
alias dc='docker-compose'
alias dm='docker-machine'

# ls
case "${OSTYPE}" in
darwin*)
    alias    l='ls -lahG'
    alias   ll='ls -lahG'
    alias  lll='ls -lahG'
    alias   ls='ls -ahG'
    ;;
freebsd*)
    alias    l='ls -lahG'
    alias   ll='ls -lahG'
    alias  lll='ls -lahG'
    alias   ls='ls -ahG'
    ;;
linux*)
    alias    l='ls -lah --color'
    alias   ll='ls -lah --color'
    alias  lll='ls -lah --color'
    alias   ls='ls -ah  --color'
    alias open='gnome-open 2>/dev/null'
    ;;
cygwin*)
    alias    l='ls -lah --color'
    alias   ll='ls -lah --color'
    alias  lll='ls -lah --color'
    alias   ls='ls -ah  --color'
    alias open='cygstart'
    ;;
esac

# rm
# alias rm="rm -v"

# process
alias 'ps?'='pgrep -l -f'
alias pk='pkill -f'
alias jo="jobs -l"

# du/df
alias du="du -h"
alias df="df -h"
alias duh="du -h ./ --max-depth=1"

# su
alias su="su -l"

# less
alias less='less -r'

# mvim
alias gvim='open -a MacVim'
alias mvim='open -a MacVim'

# marked
alias 'md'='open -a marked.app'

# bundle
alias 'be'='bundle exec'

# extract http://d.hatena.ne.jp/jeneshicc/20110215/1297778049
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.lzma)      lzma -dv $1    ;;
          *.xz)        xz -dv $1      ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
alias ex='extract'

alias make='make -j'

# alias tmux='rm -rf /tmp/tmux* && tmux'
#}}}


#
# History
#
# {{{
## share history
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'

## historical backward/forward search with linehead string binded to ^P/^N
#
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^p" history-beginning-search-backward-end
# bindkey "^n" history-beginning-search-forward-end
# bindkey "\\ep" history-beginning-search-backward-end
# bindkey "\\en" history-beginning-search-forward-end

# # glob(*)によるインクリメンタルサーチ
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^S' history-incremental-pattern-search-forward

# ## Command history configuration
# HISTFILE=~/.zsh_history
# HISTSIZE=1000000
# SAVEHIST=1000000
# }}}


#
# Function
#
#{{{
## Reload
function reload() {
  source ${HOME}/.bashrc
}

function update() {
  pushd ${HOME}/.dotfiles > /dev/null && git pull && popd > /dev/null && reload
}

function rmf(){
   for file in $*
   do
      __rm_single_file $file
   done
}

function __rm_single_file(){
       if ! [ -d ~/.Trash/ ]
       then
               command /bin/mkdir ~/.Trash
       fi

       if ! [ $# -eq 1 ]
       then
               echo "__rm_single_file: 1 argument required but $# passed."
               return
       fi

       if [ -e $1 ]
       then
               BASENAME=`basename $1`
               NAME=$BASENAME
               COUNT=0
               while [ -e ~/.Trash/$NAME ]
               do
                       COUNT=$(($COUNT+1))
                       NAME="$BASENAME.$COUNT"
               done

               command /bin/mv $1 ~/.Trash/$NAME
       else
               echo "No such file or directory: $file"
       fi
}

function rep() {
    if [ -z $1 ] ; then
        return
    fi
    echo "replace $1 -> $2"
    find . -type f | xargs sed -i "s/$1/$2/g"
}

function sweep() {
	docker rm $(docker ps -q -f status=exited)
	docker rmi $(docker images -q -f dangling=true)
}

#}}}


#
# import
#
# {{{
case "${OSTYPE}" in
    darwin*)
        # bash-completion
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            . `brew --prefix`/etc/bash_completion
        fi

        # node
        export PATH=$PATH:/usr/local/share/npm/bin
        ;;
esac

## jump
_Z_CMD=j
[ -f ~/.zsh/z.sh ] && source ~/.zsh/z.sh
rm ~/.z.* 2>/dev/null

## git-completion.sh
source ~/.zsh/git-completion.bash

## git-prompt.sh
source ~/.zsh/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=

## docker
source ~/.zsh/docker-compose.sh

## rbenv
[ -d ~/.rbenv  ] && export PATH=${HOME}/.rbenv/bin:${PATH}
[ -d ~/.rbenv  ] && eval "$(rbenv init -)"

## pyenv
[ -d ~/.pyenv ] && export PYENV_ROOT="$HOME/.pyenv"
[ -d ~/.pyenv ] && export PATH="$PYENV_ROOT/bin:$PATH"
[ -d ~/.pyenv ] && eval "$(pyenv init -)"


## local固有設定
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# }}}

