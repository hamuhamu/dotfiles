"====================
" init
"====================
set nocompatible
filetype off
filetype plugin indent on
" ビープ音を無効化
set visualbell t_vb=
" no create vim.txt~
set nobackup
" .un~ nocreate
set noundofile
set backspace=indent,eol,start

"====================
" encoding
"====================
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

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

" Async vim
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
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
        \ 'php' : $HOME . '/.vim/dict/php.dict',
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


" QuickRun  Program execute view
NeoBundle 'thinca/vim-quickrun'
" :QuickRun {program name}
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}

" syntax check
" :w after syntax check
" :SyntasticInfo perl checker check
NeoBundle 'scrooloose/syntastic.git'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
" perl syntax check enable
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']


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
" <C-p> ctrlp open
" Ctrlp Opened
" <C-c> close
" <C-d> path | file exchange
" <C-r> regex
" <C-j> Down
" <C-k> Up
" <C-u> Clear
" <C-n> History
" <C-p> History
" <C-m> file open
" <C-t> tab
" <C-v> vertical
" <C-s> split

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


" % tag jump extension
NeoBundle 'tmhedberg/matchit'
" Uppercase/Lowercase ignore
let b:match_ignorecase = 1


"====================
" autocmd
"====================
" カーソル位置保存
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview
set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!


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
" C言語ライクインデント
set cindent


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
set cursorline
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
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
" iTermのみ挿入時にカーソルを棒状にする
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"


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
" ペーストモードのトグル
set pastetoggle=<C-E>
" yank clipboard copy
" $shell vim --version | grep clipboard
" if $shell +clipboard
set clipboard+=unnamed


" insertモード
inoremap jj <esc>
inoremap <C-D> <Del>

noremap ; :
noremap : ;

" clipbord copy
nnoremap copy :w !pbcopy<CR>

" yank & cut & paste
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
