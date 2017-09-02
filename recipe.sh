brew cask install dragondrop
brew cask install dropbox
brew cask install iterm2
brew cask install mysqlworkbench
brew cask install xtrafinder
brew cask install slack
brew cask install caffeine
brew cask install alfred
brew cask install evernote
brew cask install dash
brew cask install java
brew cask install karabiner
brew cask install hyperswitch
brew cask install bettertouchtool
brew cask install shiftit
brew cask install vagrant
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install lastpass
brew cask install google-japanese-ime
brew cask install google-chrome
brew cask install phpstorm
brew install jq
# https://github.com/mrowa44/emojify
brew install emojify

brew install tig
brew install ansible
# ゴミ箱に削除
brew install trash
brew install go
brew tap peco/peco
brew install peco

brew install hub

brew install tree
brew install vim
brew install wget
brew install htop
brew install tmux
brew install ag
brew install gibo
# tmuxとMacクリップボードを同期できる
brew install reattach-to-user-namespace

brew tap homebrew/versions

# http://qiita.com/strsk/items/9151cef7e68f0746820d
brew tap motemen/ghq
brew install ghq

# iTermテンプレート
ghq get https://github.com/altercation/solarized.git

# .DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# composerをインストール
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin
mv ~/bin/{composer.phar,composer}

# phpunitインストール
curl -sSL https://phar.phpunit.de/phpunit.phar > ~/bin/phpunit
chmod 775 ~/bin/phpunit

brew install npm
# TextLint
# @https://github.com/textlint/textlint
npm install textlint -g
# @see https://github.com/textlint-ja/textlint-rule-max-ten
npm install textlint-rule-max-ten -g
