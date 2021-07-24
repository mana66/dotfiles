" 内部文字コード
set encoding=utf-8
"起動シェル
set shell=/usr/bin/bash

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

" 矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" ヘルプファイルパス設定
set runtimepath+=~/.vim/vimdoc-ja-master
set helplang=ja,en

" 新しいウィンドウを右に開く
set splitright
" 新しいウィンドウを下に開く
set splitbelow


" unicode ambiguous widthの設定 
"set ambiwidth=double


"----------------------------------------------
" netrwの設定
"----------------------------------------------
" File Explorer start

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_preview=1
let g:netrw_alto=0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 85

function! ToggleVExplorer()
      Lexplore
      vertical resize 30
endfunction

map <silent> <C-n> :call ToggleVExplorer()<CR>

" File Explorer end

"----------------------------------------------
" 検索
"----------------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイルの先頭から再び検索
set wrapscan
" インクリメンタルサーチ(検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch


"----------------------------------------------
" 表示設定
"----------------------------------------------
" エラーメッセージの表示時にビープ音を鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下に入力中のコマンドを表示
set showcmd
" 長い行を表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" コメントの色を水色
hi Comment ctermfg=3
" タイトルを表示
set title
" 行番号の表示
set number
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" ヘルプを画面いっぱいに表示
set helpheight=999
" 色
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE


"----------------------------------------------
" タブ/インデントの設定
"----------------------------------------------
" タブをスペースに置き換える
set expandtab
" タブの幅
set tabstop=2
" 自動インデント
set shiftwidth=2
" オートインデント
set autoindent
" スマートインデント
set smartindent


"----------------------------------------------
"カスタムコマンド
"----------------------------------------------
nnoremap <leader>e :execute "Explore" getcwd()


"----------------------------------------------
" プラグイン
"----------------------------------------------
"プラグインディレクトリの指定
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {-> [execute('source ' . v:val)]})
"runtime! _config/*.vim
