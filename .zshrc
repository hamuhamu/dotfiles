export LANG=ja_JP.UTF-8

autoload colors
colors

PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "

 PROMPT2='[%n]> '

####################
# ailias
####################
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias cl='clear'


PERL_MB_OPT="--install_base \"/Users/y-ohhashi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/y-ohhashi/perl5"; export PERL_MM_OPT;
