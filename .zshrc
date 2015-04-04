#####################################
# char set
#####################################
export LANG=ja_JP.UTF-8


######################################
# color
######################################
autoload -Uz colors; colors
export CLICOLOR=true
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

######################################
# setting
######################################
export SVN_EDITOR=vim
export GREP_OPTIONS='--color=auto'


######################################
# prompt
#######################################
#
# colorの設定後にpromptの設定をすること！
# screen時にうまく引き継げない
#
# %~ => ~current directory
# %n => usernaem %m => hostname %# => usertype(#=root, %=normal)
SUCCESS='^_^'
FAIL='ToT'

PROMPT=''
PROMPT+="%(?.${fg[cyan]}$SUCCESS.${fg[red]}$FAIL) "
PROMPT+="%{${fg[green]}%}%~%{${reset_color}%} 
[%n@%m] %# "

PROMPT2="[%n]> "
######################################
# complete
######################################
# mkdir $HOME/.zsh
# cd $HOME/.zsh
# git clone git@github.com:zsh-users/zsh-completions.git
fpath=($HOME/.zsh/zsh-completions/src(N-/) $fpath)
autoload -Uz compinit; compinit
# complete after = --prefix=/usr => --prefix=<Tab>
setopt magic_equal_subst
# candidate pack
setopt list_packed
zstyle ':completion:*:default' menu select=2

######################################
# history
######################################
HISTFILE="$HOME/.zsh_history"
# memory save num
HISTSIZE=10000
# HISTFILE save num
SAVEHIST=10000
# command of history duplication ignore
setopt hist_ignore_all_dups
# command of <Space>command ignore
setopt hist_ignore_space
# start to end timestanp
setopt extended_history
# other shell history share
setopt share_history
# reduce blanks  ls   -l => ls -l
setopt hist_reduce_blanks


######################################
# directory
######################################
# cd /home => /home cd ../ => ..
setopt auto_cd
# dirctory of stack push cd -<Tab>
setopt auto_pushd
# directory of stack duplication ignore
setopt pushd_ignore_dups


######################################
# other
######################################
# vim like
bindkey -v
bindkey 'jj' vi-cmd-mode
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char
# back ground job state notice
setopt notify
setopt no_beep
# command spell correct
setopt correct
# ^Dでzshを終了しない
setopt ignore_eof
# ^Q/^Sのフローコントロールを無効
setopt no_flow_control

######################################
# peco
######################################
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
# control + r => zsh history
bindkey '^r' peco-select-history

function peco-pushd() {
  eval cd $(pushd | sed -e "s/ /\n/g" | peco)
  zle reset-prompt
}
zle -N peco-pushd
bindkey '^a' peco-pushd

######################################
# cdr 移動したディレクトリの履歴
# cdr -l
######################################
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs


zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

######################################
# zman
######################################
# % zman SEARCH_HISTORY
function zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

######################################
# ailias
######################################
alias ll='ls -la'
alias vi='vim'
alias cl='clear'
alias sc='screen'
alias t='tmux'

alias -g A='| ag'
alias -g G='| grep'
alias -g X='| xargs'
alias -g C='| cat'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g W='| wc'

PERL_MB_OPT="--install_base \"/Users/y-ohhashi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/y-ohhashi/perl5"; export PERL_MM_OPT;
