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


if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setting PATH for Python 3.4
# The orginal version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"


export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

if [ -f ~/.zprofile.local ] ; then
    . ~/.zshrc.local
fi
