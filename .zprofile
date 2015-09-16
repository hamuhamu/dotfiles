if [ -f ~/.zshrc ] ; then
    . ~/.zshrc
fi

# antigen zshで、モジュールのバージョン管理
# antigen list
# antigen update
# antigen selfupdate
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
    source $HOME/.zsh/antigen/antigen.zsh
    # モジュール
    antigen-bundle peco/peco

    antigen-apply
fi

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

# この設定いるのか？
if [ -f ~/.zprofile.local ] ; then
    . ~/.zshrc.local
fi
