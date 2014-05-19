"====================
" init
"====================
set nocompatible
filetype off
" ビープ音を無効化
set visualbell t_vb=
set nobackup

"====================
" encoding
"====================
set encoding=utf-8
set termencoding=utf-8

"====================
" NeoBundle
"====================
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
           \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" MarkDown filetype
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'

"====================
" tab & indent
"====================
" タブを半角スペースにする
set expandtab
" 画面上見た目のtabスペース
set  tabstop=4
" 実際に挿入されるtabの数
" 0にsetすることでtabstopと同じ値になる
set softtabstop=0
" オートインデントによって挿入されるインデント幅
set shiftwidth=4
" 改行時のインデントそろえる
set autoindent
" 高度なインデント行う
set smartindent

"====================
" view
"====================
" シンタックスにハイライトを付ける
syntax on
" どこの階層のファイルを編集しているか表示される
set title
" 指定した値の行の上下が必ず表示される
" 999とすることで常にウィンドウの中央となる
set scrolloff=999
" カーソルが付いている行にラインを入れる
set cursorline
" 行番号表示
set number
" タブ、空白、改行を表示
set list
" タブ、空白、改行の設定
" 改行は表示させない設定にしている
set listchars=tab:>-,extends:<,trail:-
" 対応するかっこを表示する
set showmatch


"====================
" comand
"====================
" コマンドラインモードでファイル名を補完する
set wildmenu
" コマンドラインモードでファイル名をリスト表示にする
set wildmode=full:list
" コマンドラインの履歴保持数
set history=100
" カーソルが何行目の何列目か表示
set ruler

"====================
" string operation
"====================
" 検索対象をハイライトする
set hlsearch
" 小文字検索に大文字小文字を区別しない
set ignorecase
" 大文字が混在する検索に大文字小文字を区別する
set smartcase
" 文字入力されるたびに検索を行う
set incsearch
" 置換時、同一行に対象の文字列があれば置換を行う
set gdefault
" 検索が末尾まで進んだ際、先頭から再び検索する
set wrapscan

" insertモード
inoremap jj <esc>
