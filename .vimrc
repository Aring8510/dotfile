set number
set wrapscan
set hlsearch
set incsearch
"set showmatch matchtime=1
set guioptions+=a
set smartindent
set autoindent
set title
set clipboard=unnamed,autoselect
set expandtab
set shiftwidth=4
set tabstop=4
set list
set wildmenu
set mouse=a
"colorscheme evening
noremap <C-j> <esc>
noremap! <C-j> <esc>
set hidden
"set cursorline
set background=dark
inoremap <C-s> <C-p>
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
noremap <S-h>   ^
noremap <S-l>   $
noremap <space> %
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
nnoremap j gj
nnoremap k gk
:command FF tabnew


if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'LeafCage/yankround.vim'
"Plug 
call plug#end()
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|' "use |, ? or │
let g:NERDTreeShowBookmarks=1
"autocmd vimenter * NERDTree
nnoremap <silent><C-s> :NERDTreeToggle<CR>
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
