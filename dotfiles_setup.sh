# ドットファイルをホームディレクトリにシムリンクを貼る
ln -sf ${HOME}/dotfiles/.vimrc ${HOME}
ln -sf ${HOME}/dotfiles/.gvimrc ${HOME}

ln -sf ${HOME}/dotfiles/.bash_profile ${HOME}
ln -sf ${HOME}/dotfiles/.bashrc ${HOME}

ln -sf ${HOME}/dotfiles/.zprofile ${HOME}
ln -sf ${HOME}/dotfiles/.zshrc ${HOME}

ln -sf ${HOME}/dotfiles/.gitconfig ${HOME}

ln -sf ${HOME}/dotfiles/.screenrc ${HOME}

ln -sf ${HOME}/dotfiles/.vim/after/ftplugin ${HOME}/.vim/after/ftplugin
ln -sf ${HOME}/dotfiles/.vim/template ${HOME}/.vim/template
ln -sf ${HOME}/dotfiles/.vim/snippets ${HOME}/.vim/snippets

