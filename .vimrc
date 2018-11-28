"vimrc
"------------------------------------(setコマンド群)----------------------------
set background=dark "backgroundをダークにする
set clipboard=unnamed,autoselect " *に自動でヤンクする,Visualmodeで選択したものを自動でヤンクする
set cursorline "その行をハイライトする
set expandtab "タブの代わりにスペースを挿入する
set fenc=utf-8 "utf-8で編集
set hidden "保存してなくても別のファイルを開けるようにする
set hlsearch "検索でハイライト
set incsearch "インクリメンタルサーチをする
set list "不可視文字を表示
set listchars=tab:>-,trail:~,eol:< " 不可視文字がそれぞれこうなる
set mouse=a "マウスを有効
set nobackup "backupファイルを作らない
set noswapfile "swapファイルを作らない
set number "行番号を表示
set shiftwidth=4 "space4つでインデント
set showcmd "コマンドを表示
" set smartindent " 1行目のインデントに基づくがc言語構文らしくやる
set autoindent " 1行目のインデントに基づくがc言語構文らしくやる
set tabstop=4 " tabのしめる大きさ
set title "タイトルを表示
set visualbell t_vb= "ビーブ音を鳴らさない
set wildmenu " コマンドの候補が見えるようになる
set winaltkeys=no " ALTキー押下時にメニューにフォーカスしないようにする
set wrapscan " 末尾まで検索したら頭までもどる
set splitright " vsplitで右にウィンドウ生成
set splitbelow " splitで下にウィンドウ生成
syntax on

filetype plugin indent on " インデントをファイルに合わせる
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
"----------------------------------------(マッピング)----------------------------
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-D> <Delete>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <M-k> <UP>
inoremap <M-j> <Down>
inoremap <M-l> <Right>
inoremap <M-h> <Left>
inoremap <M-a> <Home>
inoremap <M-e> <End>
inoremap <M-b> <C-o>b
inoremap <M-w> <C-o>w
inoremap <M-u> <C-o><C-u>
inoremap <M-d> <C-o><C-d>
inoremap <M-d> <Delete>
nnoremap <space>1 :b1<CR>
nnoremap <space>2 :b2<CR>
nnoremap <space>3 :b3<CR>
nnoremap <space>4 :b4<CR>
nnoremap <space>5 :b5<CR>
nnoremap <space>6 :b6<CR>
nnoremap <space>7 :b7<CR>
nnoremap <space>8 :b8<CR>
nnoremap <space>9 :b9<CR>
nnoremap <space><space> :b#<CR>
nnoremap <space>h :bnext<CR>
nnoremap <space>l :bprevious<CR>
nnoremap <space>d :bd<CR>
nnoremap j gj
nnoremap k gk
noremap <C-h> d0
noremap <C-l> d$
noremap <CR> o<esc>j
noremap <S-CR> <S-o><esc>k
noremap <S-h> ^
noremap <S-l> $

:command FF tabnew
"------------------------------------プラグイン(vimplug)----------------------------
call plug#begin('~/.vim/plugged') " VimPlugを用いてプラグイン管理
Plug 'LeafCage/yankround.vim' " ペースト時のレジスタの操作ｃ
Plug 'Shougo/neocomplete.vim' "補完機能を強化する
Plug 'Shougo/neosnippet' " コードスニペットの強化
Plug 'Shougo/neosnippet-snippets' " 更に強化
Plug 'Shougo/unite.vim' "様々なShougoプラグインを結合する
Plug 'Yggdroot/indentLine' "indentを示す縦棒
Plug 'airblade/vim-gitgutter' " gitの差分の+-を左に表示
Plug 'bling/vim-bufferline' " 開いているbufferをステータスバーに表示する
Plug 'cohama/lexima.vim' " 括弧をスマートに
Plug 'easymotion/vim-easymotion' " 移動をスマートに
Plug 'junegunn/vim-easy-align' " テキスト整形=などに合わせる
Plug 'junegunn/vim-peekaboo' " レジスタの中身を見る
Plug 'luochen1990/rainbow' " 括弧がレインボー!!
Plug 'scrooloose/nerdtree' " ファイルツリーを表示する
Plug 'simeji/winresizer' " ウィンドウの大きさ変更
"Plug 'Markdown' " マークダウンを認識する
"Plug 'suan/vim-instant-markdown' " マークダウンのプレビュー
Plug 'thinca/vim-quickrun' " クイックランをする
Plug 'tpope/vim-fugitive' " gitの操作
Plug 'tpope/vim-surround' " 括弧やらで囲む
Plug 'tyru/caw.vim' " M-mでコメントトグル
Plug 'vim-airline/vim-airline' " 便利なステータスバー
Plug 'w0rp/ale' "シンタックスチェッカー
Plug 'jacoborus/tender.vim' " ColorScheme
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
"--------------------NERDTree----------------------
"autocmd vimenter * NERDTree
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('c',    'darkgreen',    'none', 'darkgreen',    '#151515')
call NERDTreeHighlightFile('class',   'darkgray',  'none', 'darkgray',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('css',    'blue', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('java',   'yellow',    'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
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
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <space>j <Plug>(easymotion-overwin-line)
nmap <space>s <Plug>(easymotion-overwin-f2)
map <space>k <Plug>(easymotion-overwin-line)
map <space>w <Plug>(easymotion-overwin-w)
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
"--------------------peekaboo----------------------
let g:peekaboo_window='vert bo new'
"--------------------mineo----------------------
"mineo.dllを$VIMにいれて，mineo.vimを$VIM$vimfiles$にいれて，dictフォルダを＄VIMに入れる
"g/でローマ字でも日本語をサーチ
if has("migemo")
    set migemo
endif
