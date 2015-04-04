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
let mapleader = ','
" encoding {{{1
"====================
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8

" NeoBundle {{{1
"====================
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" call neobundle#rc(expand('~/.vim/bundle/'))
call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" :Encode euc-jp
command! -nargs=1 Encode :e ++enc=<args>

" 日本語help
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <Leader>f :VimFilerExplorer<CR>

" Async vim
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin'  : 'make -f make_cygwin.mak',
    \ 'mac'     : 'make -f make_mac.mak',
    \ 'unix'    : 'make -f make_unix.mak',
  \ },
\}
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" vim 7.4~
if v:version >= 740
    NeoBundle 'Shougo/neocomplete'
else
    NeoBundle 'neocomplcache'
    let g:neocomplcache_enable_at_startup  = 1
    let g:neocomplcache_enable_auto_select = 0
    let g:neocomplcache_enable_smart_case  = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
    inoremap <expr><C-y> neocomplcache#close_popup()
    inoremap <expr><C-e> neocomplcache#cancel_popup()
    inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'php'     : $HOME . '/.vim/dict/php.dict',
        \ }
endif

" echo function docments
NeoBundle 'Shougo/echodoc', '', 'default'
" insert mode to load
call neobundle#config('echodoc', {
\ 'lazy' : 1,
\ 'autoload' : {
\ 'insert' : 1,
\ }})

" visual mode
" :B Exコマンド(sortなど)
NeoBundle 'taku-o/vim-vis'

" QuickRun  Program execute view
NeoBundle 'thinca/vim-quickrun'
" :QuickRun {program name}
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}

NeoBundle 'thinca/vim-ref'
" brew install w3m
" tar xzvf php_manual_ja.tar.gz
" mv ~/php-chunked-xhtml ~/.vim/
 let g:ref_phpmanual_path = $HOME . '/.vim/phpmanual/'

let g:ref_source_webdict_use_cache = 1
let g:ref_source_webdict_sites = {
            \ 'alc' : {
            \   'url' : 'http://eow.alc.co.jp/%s/UTF-8/'
            \   }
            \ }
" 出力フィルタ 先頭から行を削除している
function! g:ref_source_webdict_sites.alc.filter(output)
      return join(split(a:output, "\n")[25 :], "\n")
endfunction

:cnoremap aa Ref webdict alc<Space>

" syntax check
" :w after syntax check
" :SyntasticInfo perl checker check
NeoBundle 'scrooloose/syntastic.git'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
" perl syntax check enable
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

" 括弧や引用符の編集ができる
" visual mode S"   選択範囲"で囲む
" nolmal mode ds"  "を削除
" nolmal mode cs"' "を'に変換
NeoBundle 'tpope/vim-surround'

" yank to history reuse
NeoBundle 'LeafCage/yankround.vim'
" yank history
let g:yankround_max_history = 35
let g:yankround_dir = '~/.cache/yankround'
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
" paste after <C-p> yank prev
nmap <C-p> <Plug>(yankround-prev)
" paste after <C-n> yank next
nmap <C-n> <Plug>(yankround-next)
" ctrlp.vim conflict measures
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
" paste after g<C-p> yank history
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>


" CtrlP file search
NeoBundle 'kien/ctrlp.vim'
" Match files Full Screen
let g:ctrlp_max_height = &lines

" Open Browser
NeoBundle 'git@github.com:tyru/open-browser.vim.git'
" PreVim    MarkDown Preview
NeoBundle 'kannokanno/previm'
" MarkDown filetype
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" https://github.com/tpope/vim-abolish
NeoBundle 'tpope/vim-abolish'

" % tag jump extension
NeoBundle 'tmhedberg/matchit'
" Uppercase/Lowercase ignore
let b:match_ignorecase = 1

NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'alpaca-tc/alpaca_powertabline'
set noshowmode

NeoBundle 'rking/ag.vim'

NeoBundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
set t_Co=256
NeoBundle 'haya14busa/vim-migemo'

    " EasyMotion Config {{{
    " https://github.com/Lokaltog/vim-easymotion
    NeoBundle 'Lokaltog/vim-easymotion'
    nmap s <Plug>(easymotion-s2)
    nmap t <Plug>(easymotion-t2)
    " Tab:ページアップ
    " S-Tab:ページダウン
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)
    " 大文字小文字無視
    let g:EasyMotion_smartcase = 1
    " ダウンロード
    let g:EasyMotion_use_migemo = 1
     "}}}

" autocmd {{{1
"====================
" カーソル位置保存
augroup CursorSave
  autocmd BufWinLeave ?* silent mkview
  autocmd BufWinEnter ?* silent loadview
  autocmd InsertEnter,InsertLeave * set cursorline
augroup END

" 単語スペルチェック 間違ったスペルの場合、下線を引いてくれる
fun! s:SpellConf()
  redir! => syntax
  silent syntax
  redir END

  set spell

  if syntax =~? '/<comment\>'
    syntax spell default
    syntax match SpellNotAscii /\<\A\+\>/ contains=@NoSpell transparent containedin=Comment contained
    syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
  else
    syntax spell toplevel
    syntax match SpellNotAscii /\<\A\+\>/ contains=@NoSpell transparent
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

" clipbord copy
nnoremap copy :w !pbcopy<CR>

" yank & cut & paste
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" command history + filtering
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" カーソル位置の文字列をc*で、置換対象にする
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
vnoremap <expr> c* ':s ;\<' . expand('<cword>') . '\>;'

filetype plugin indent on

" marker {{{1
"====================
" markerは、上下marklines内に設定を記述する必要がある
" zc 折りたたむ zo あける
" foldcolumn 左の余白

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
"

