# ドットファイルをホームディレクトリにシムリンクを貼る
for i in `ls -a`
do
    [[ -f ${HOME}/dotfiles/$i ]] || continue # ファイル以外ならcontinue
    [[ $i =~ ^\..*$ ]] || continue           # .から始まるファイルでなければcontinue

    ln -sf ${HOME}/dotfiles/$i ${HOME}
done

#######################################################################
# binの設定
#######################################################################
mkdir -p ${HOME}/bin
ln -sf ${HOME}/dotfiles/bin/* ${HOME}/bin

#######################################################################
# vimの設定
#######################################################################
mkdir -p ${HOME}/.vim/
mkdir -p ${HOME}/.vim/bundle

# NeoBundleのインストール
[[ -e ${HOME}/.vim/bundle/neobundle.vim ]] || git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim

ln -sfn ${HOME}/dotfiles/.vim/template ${HOME}/.vim/template
ln -sfn ${HOME}/dotfiles/.vim/snippets ${HOME}/.vim/snippets

mkdir -p ${HOME}/.vim/after/
ln -sfn ${HOME}/dotfiles/.vim/after/ftplugin ${HOME}/.vim/after/ftplugin
