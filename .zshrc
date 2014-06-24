####################
# char set
####################
export LANG=ja_JP.UTF-8

autoload -U colors
colors
# %~ => ~current directory
# %n => usernaem %m => hostname %# => usertype(#=root, %=normal)
PROMPT="%{${fg[green]}%}%~%{${reset_color}%} 
[%n@%m] %# "

 PROMPT2='[%n]> '

####################
# complete
####################
autoload -Uz compinit
compinit

####################
# history
#####################
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000


####################
# ailias
####################
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias cl='clear'


PERL_MB_OPT="--install_base \"/Users/y-ohhashi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/y-ohhashi/perl5"; export PERL_MM_OPT;
