" init {{{1
"====================
set nocompatible
filetype off
filetype plugin indent off

" condition variables
let g:is_windows = has('win32') || has('win64')
let g:is_unix = has('unix')
let g:is_gui = has('gui_running')
let g:is_terminal = !g:is_gui
let g:is_unicode = (&termencoding ==# 'utf-8' || &encoding == 'utf-8') && !(exists('g:discard_unicode') && g:discard_unicode != 0)
"
" ビープ音を無効化
set visualbell t_vb=
" no create vim.txt~
set nobackup
set modeline
" ファイル上下lines分まで検索する
set modelines=5

" vim 7.4~
if v:version >= 740
    " .un~ nocreate
    set noundofile
endif

set backspace=indent,eol,start
" normarmode japanese off
set imdisable


" Leader {{{1
" LeaderをSpaceに設定
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" encoding {{{1
"====================
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,ucs-bom
" vimrcのエンコード
scriptencoding utf-8

" vimで編集中のファイルをエンコード変換をかけるコマンドをわかりやすくした
" Usage :Encode euc-jp
command! -nargs=1 Encode :e ++enc=<args>


" NeoBundle {{{1
"====================

" vim 7.2以上でなければ、NeoBundleが使えない
if v:version >= 702
    if filereadable(expand('~/dotfiles/.vimrc.neobundle'))
        source ~/dotfiles/.vimrc.neobundle
    endif
endif

" autocmd {{{1
"====================
" カーソル位置保存
augroup CursorSave
  autocmd BufWinLeave ?* silent mkview
  autocmd BufWinEnter ?* silent loadview
  autocmd InsertEnter,InsertLeave * set cursorline
augroup END

" 単語スペルチェック 間違ったスペルの場合、下線を引いてくれる
set spelllang=en,cjk

fun! s:SpellConf()
    redir! => syntax
    silent syntax
    redir END

    set spell

    if syntax =~? '/<comment\>'
        syntax spell default
        syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
    else
        syntax spell toplevel
        syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
    endif

    syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
endfunc

augroup spell_check
    autocmd!
    autocmd BufReadPost,BufNewFile,Syntax * call s:SpellConf()
augroup END

" tab & indent {{{1
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
" C言語ライクインデント
set cindent


" view {{{1
"====================
" どこの階層のファイルを編集しているか表示される
set title
" 指定した値の行の上下が必ず表示される
" 999とすることで常にウィンドウの中央となる
set scrolloff=999
set cursorline
" 再描画しない
set lazyredraw
" 行番号表示
set number
" status line
set laststatus=2
" %f filename encoding %l line %c char
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%lL,%cC%V%8P
set cmdheight=2
" タブ、空白、改行を表示
set list
" タブ、空白、改行の設定
" 改行は表示させない設定にしている
set listchars=tab:>-,extends:<,trail:-
" 対応するかっこを表示する
set showmatch
set completeopt=menuone
" 矩形選択時のみ仮想編集できる
set virtualedit=block
" iTermのみ挿入時にカーソルを棒状にする
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" comand {{{1
"====================
" コマンドラインモードでファイル名を補完する
set wildmenu
" コマンドラインモードでファイル名をリスト表示にする
set wildmode=full:list
" コマンドラインの履歴保持数
set history=100
" カーソルが何行目の何列目か表示
set ruler


" string operation {{{1
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
"set gdefault
" 検索が末尾まで進んだ際、先頭から再び検索する
set wrapscan
" ペーストモードのトグル
set pastetoggle=<C-E>
" yank clipboard copy
" $shell vim --version | grep clipboard
" if $shell +clipboard
set clipboard+=unnamed
" ヤンクなどで + レジスタにも書き込む
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

" Buffer {{{1
"====================
" 外部でファイルが変更されたら自動で読みなおす
set autoread
" 隠れ状態にしない
set nohidden
set noswapfile
" keymap {{{1
"====================
" insertモード
inoremap jj <esc>
inoremap <C-D> <Del>

noremap j gj
noremap k gk
noremap ; :
noremap : ;

" 誤打が多いので、インタラクティブなExモードを無効にする
nnoremap Q <Nop>
" ウィンドウ移動をTabで行える
nnoremap <Tab> <C-w>w

" 記号は押しにくいのでmapを貼る
inoremap <C-a> @
inoremap <C-d> $
inoremap <C-p><C-l> +
inoremap <C-m><C-i> -
inoremap <C-e><C-q> =

" 複数ファイルを同時に終了・保存する
nnoremap <C-q><C-q> :qa<CR>
nnoremap <C-w><C-w> :wa<CR>
nnoremap <C-w><C-q> :wqa<CR>

" clipbord copy
nnoremap copy :w !pbcopy<CR>

" yank & cut & paste
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" 無名レジスタではなく直前にヤンクしたヤンクレジスタからペースト
nnoremap <C-P> "0p

" command history + filtering
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" カーソル位置の文字列をc*で、置換対象にする
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
vnoremap <expr> c* ':s ;\<' . expand('<cword>') . '\>;'

filetype plugin indent on

" template {{{1

" BufNewFileイベントは、FileTypeイベント(php,vimなど)の前に実行されるので.vimrcに書くしか無い
augroup Template_PHPUnit
    autocmd!
    autocmd BufNewFile *Test.php 0read $HOME/.vim/template/php/PhpUnitTest.php
augroup END


" .vimrc.local {{{1

" ローカル固有のvimrcの設定
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif


" marker {{{1
"====================
" markerは、上下marklines内に設定を記述する必要がある
" zc 折りたたむ zo あける
" foldcolumn 左の余白

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
"

