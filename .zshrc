#####################################
# char set
#####################################
export LANG=ja_JP.UTF-8


######################################
# prompt
#######################################
# %~ => ~current directory
# %n => usernaem %m => hostname %# => usertype(#=root, %=normal)
SUCCESS="^_^"
FAIL="ToT"

PROMPT=""
PROMPT+="%(?.${fg[cyan]}$SUCCESS.${fg[red]}$FAIL) "
PROMPT+="%{${fg[green]}%}%~%{${reset_color}%} 
[%n@%m] %# "

PROMPT2='[%n]> '



######################################
# color
######################################
autoload -U colors; colors
export CLICOLOR=true


######################################
# complete
######################################
autoload -U compinit; compinit
# complete after = --prefix=/usr => --prefix=<Tab>
setopt magic_equal_subst
# candidate pack
setopt list_packed


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
# back ground job state notice
setopt notify
setopt no_beep
# command spell correct
setopt correct


######################################
# ailias
######################################
alias ll='ls -la'
alias vi='vim'
alias cl='clear'


PERL_MB_OPT="--install_base \"/Users/y-ohhashi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/y-ohhashi/perl5"; export PERL_MM_OPT;
