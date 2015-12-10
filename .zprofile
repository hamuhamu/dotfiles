if [ -f ~/.zshrc ] ; then
    . ~/.zshrc
fi

source $HOME/dotfiles/.zprofile.antigen

export SVN_EDITOR=vim

# /usr/localを最優先で読み込み
export PATH=/usr/local:$PATH
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# plenv
if [ -d $HOME/.plenv/bin ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

# phpenv
if [ -d $HOME/.phpenv/bin ]; then
    export PATH="$HOME/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
fi

# pyenv
if [ -d $HOME/.pyenv/bin ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [ -f ~/.zprofile.local ] ; then
    . ~/.zshrc.local
fi
