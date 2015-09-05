# ドットファイルをホームディレクトリにシムリンクを貼る
ln -sf ${HOME}/dotfiles/.vimrc ${HOME}
ln -sf ${HOME}/dotfiles/.gvimrc ${HOME}

ln -sf ${HOME}/dotfiles/.bash_profile ${HOME}
ln -sf ${HOME}/dotfiles/.bashrc ${HOME}

ln -sf ${HOME}/dotfiles/.zprofile ${HOME}
ln -sf ${HOME}/dotfiles/.zshrc ${HOME}

ln -sf ${HOME}/dotfiles/.gitconfig ${HOME}

ln -sf ${HOME}/dotfiles/.screenrc ${HOME}
ln -sf ${HOME}/dotfiles/.tmux.conf ${HOME}

#######################################################################
# vimの設定
#######################################################################
mkdir -p ${HOME}/.vim/
mkdir -p ${HOME}/.vim/bundle

# NeoBundleのインストール
if [ ! -d ${HOME}/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

ln -sfn ${HOME}/dotfiles/.vim/template ${HOME}/.vim/template
ln -sfn ${HOME}/dotfiles/.vim/snippets ${HOME}/.vim/snippets

mkdir -p ${HOME}/.vim/after/
ln -sfn ${HOME}/dotfiles/.vim/after/ftplugin ${HOME}/.vim/after/ftplugin
