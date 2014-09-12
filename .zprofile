if [ -f ~/.zshrc ] ; then
    . ~/.zshrc
fi

export SVN_EDITOR=vim
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

alias phpunit='~/php/vendor/phpunit/phpunit/phpunit'
