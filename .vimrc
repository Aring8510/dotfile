"vimrc
"------------------------------------(setコマンド群)----------------------------
set fenc=utf-8
set number
set wrapscan
set hlsearch
set incsearch
"set showmatch matchtime=1
set guioptions+=a
set guioptions-=m
set guioptions-=T
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
set hidden
set cursorline
set background=dark
set listchars=tab:>-,trail:~,eol:<
set nobackup
set noswapfile
set visualbell t_vb=
set showcmd

"------------------------------------(辞書)----------------------------
autocmd FileType java :set dictionary=dic/javadic.dict
"------------------------------------(全角スペース可視化)----------------------------
hi NonText guibg=NONE guifg=DarkMagenta
hi SpecialKey guibg=NONE guifg=DarkMagenta
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
"------------------------------------(カラースキーム)----------------------------
colorscheme evening
"----------------------------------------(マッピング)----------------------------
noremap <C-j> <esc>
noremap! <C-j> <esc>
inoremap <M-k> <UP>
inoremap <M-j> <Down>
inoremap <M-l> <Right>
inoremap <M-h> <Left>
inoremap <M-a> <Home>
inoremap <M-e> <End>
inoremap <M-d> <Delete>
inoremap <M-w> <C-o>w
inoremap <M-b> <C-o>b
inoremap <M-u> <C-o><C-u>
inoremap <M-d> <C-o><C-d>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
noremap <C-h> d0
noremap <C-l> d$
"inoremap <M-> <>
noremap <S-h> ^
noremap <S-l> $
noremap <CR> o<esc>j
noremap <S-CR> <S-o><esc>k
nnoremap j gj
nnoremap k gk
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Delete>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

:command FF tabnew
"これはなんだ？(痴呆)
if &compatible
    set nocompatible
endif
"------------------------------------プラグイン(vimplug)----------------------------
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'LeafCage/yankround.vim'
Plug 'simeji/winresizer'
Plug 'luochen1990/rainbow'
Plug 'bling/vim-bufferline'
Plug 'junegunn/vim-easy-align'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tyru/caw.vim'
Plug 'easymotion/vim-easymotion'
"Plug''
call plug#end()
"------------------------------------プラグインのカスタマイズ----------------------------
"--------------------indentLine----------------------
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|' "use |, ? or │
"--------------------neocomplete----------------------
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
"--------------------neosunippet----------------------
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
"--------------------Vimfiler----------------------
nnoremap <C-k> :VimFilerExplore -split -winwidth=50 -find -no-quit<Cr>
"--------------------NERDTree----------------------
"autocmd vimenter * NERDTree
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('class',   'darkgray',  'none', 'darkgray',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('java',   'yellow',    'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('c',    'darkgreen',    'none', 'darkgreen',    '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
let g:NERDTreeShowBookmarks=1
nnoremap <silent><C-s> :NERDTreeToggle<CR>
"--------------------yankround----------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"--------------------winresizer----------------------
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
"--------------------rainbow----------------------
let g:rainbow_active = 1
let g:bufferline_echo=0
	let g:rainbow_conf = {
	\	'guifgs': [ 'Red','Green','Blue','lightRed', 'lightGreen', 'lightBlue'],
	\	'ctermfgs': [ 'Red','Green','Blue','lightRed', 'lightGreen', 'lightBlue'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
"--------------------quickrun----------------------
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"--------------------EasyAlign----------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"--------------------caw----------------------
" caw:hatpos:toggle
nmap <M-m> <Plug>(caw:hatpos:toggle)
vmap <M-m> <Plug>(caw:hatpos:toggle)
"--------------------easy-motion----------------------
map <space> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <space>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
"--------------------migemo----------------------
"mineo.dllを$VIMにいれて，mineo.vimを$VIM$vimfiles$にいれて，dictフォルダを＄VIMに入れる
"g/でローマ字でも日本語をサーチ
if has("migemo")
    set migemo
endif
