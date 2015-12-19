source $HOME/dotfiles/.zprofile.antigen

export SVN_EDITOR=vim

# /usr/localを最優先で読み込み
export PATH=/usr/local:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

# rbenv
if [ -d $HOME/.rbenv/bin ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

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

# .zprofile.local
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# .zshenvに以下の設定を記述しておくとプロファイリングしてくれる
# zmodload zsh/zprof && zprof
if (which zprof > /dev/null) ;then
      zprof | less
fi
