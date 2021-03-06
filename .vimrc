"vimrc
"------------------------------------(オプション)----------------------------
set background=dark                " backgroundをダークにする
set clipboard=unnamed,autoselect   " *に自動でヤンクする,Visualmodeで選択したものを自動でヤンクする
set cursorline                     " その行をハイライトする
set expandtab                      " タブの代わりにスペースを挿入する
set fenc=utf-8                     " utf-8で編集
set fileencodings=utf-8,sjis,cp932,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp
set hidden                         " 保存してなくても別のファイルを開けるようにする
set hlsearch                       " 検索でハイライト
set incsearch                      " インクリメンタルサーチをする
set list                           " 不可視文字を表示
set listchars=tab:>-,trail:~,eol:< " 不可視文字がそれぞれこうなる
set mouse=a                        " マウスを有効
set nobackup                       " backupファイルを作らない
set noswapfile                     " swapファイルを作らない
set number                         " 行番号を表示
" set relativenumber
set shiftwidth=4                   " space4つでインデント
set showcmd                        " コマンドを表示
" set smartindent                  " 1行目のインデントに基づくがc言語構文らしくやる
set autoindent                     " 1行目のインデントに基づく
set tabstop=4                      " tabのしめる大きさ
set title                          " タイトルを表示
set visualbell t_vb=               " ビーブ音を鳴らさない
set wildmenu                       " コマンドの候補が見えるようになる
set winaltkeys=no                  " ALTキー押下時にメニューにフォーカスしないようにする
set wrapscan                       " 末尾まで検索したら頭までもどる
set splitright                     " vsplitで右にウィンドウ生成
set splitbelow                     " splitで下にウィンドウ生成
set smarttab                       " インデントを一気に消す
set scrolloff=0                    " スクロールしたときに
set guioptions+=e
set splitright                     " 新規ウィンドウを右に開く
set undofile                       " undoの永続化
set ignorecase                     " 検索時大文字小文字を区別しない
set smartcase                      " 検索時大文字が入力されたら区別する
if has('win32') || has ('win64')   " Undoファイルの保存場所
    set undodir=~/AppData/Local/Temp/vim_un/
endif
if has("unix")                     " フォントの指定
    set guifont=DejaVu\ Sans\ Mono\ 13
endif
syntax on

filetype plugin indent on " インデントをファイルに合わせる
"------------------------------------(辞書)----------------------------
autocmd FileType java :set dictionary=dic/javadic.dict
"------------------------------------(全角スペース可視化)----------------------------
"デフォルトのZenkakuSpaceを定義
"function! ZenkakuSpace()
"  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
"endfunction
"
"if has('syntax')
"  augroup ZenkakuSpace
"    autocmd!
"    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
"    autocmd ColorScheme       * call ZenkakuSpace()
"    " 全角スペースのハイライト指定
"    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
"    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
"  augroup END
"  call ZenkakuSpace()
"endif
"----------------------------------------(マッピング)----------------------------
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-D> <Delete>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
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
inoremap <M-d> <Delete>
nnoremap <space>1 :b2<CR>
nnoremap <space>2 :b2<CR>
nnoremap <space>3 :b3<CR>
nnoremap <space>4 :b4<CR>
nnoremap <space>5 :b5<CR>
nnoremap <space>6 :b6<CR>
nnoremap <space>7 :b7<CR>
nnoremap <space>8 :b8<CR>
nnoremap <space>9 :b9<CR>
nnoremap <space><space> :b#<CR>
nnoremap <space>l :bnext<CR>
nnoremap <space>h :bprevious<CR>
nnoremap <space>d :bd<CR>
nnoremap j gj
nnoremap k gk
nnoremap x "_x
nnoremap s "_s
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
noremap <CR> o<esc>
noremap <S-CR> <S-o><esc>
noremap <C-h> ^
noremap <C-l> $
noremap <S-h> ^
noremap <S-l> $
" デフォルトではS-yは行全体のヤンクだが，行末までヤンクに変更する
noremap <S-y> y$
noremap <f2> :PlugUpdate<CR>
" フォントサイズをVimを開いたときの状態に戻す
noremap <F4> :Fontzoom!<CR>
noremap <f5> <ESC>o<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
noremap <f6> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
noremap <F7> :Fontzoom!<CR>
noremap <C-f5> :redraw<CR>
let mapleader = "\<f9>"

:command FF tabnew
:command VV vert ter
"------------------------------------プラグイン(vimplug)----------------------------
call plug#begin('~/.vim/plugged')     " VimPlugを用いてプラグイン管理
Plug 'LeafCage/yankround.vim'         " ペースト時のレジスタの操作
Plug 'Shougo/neocomplete.vim'         " 補完機能を強化する
Plug 'Shougo/neosnippet'              " コードスニペットの強化
Plug 'Shougo/neosnippet-snippets'     " 更に強化
Plug 'Shougo/unite.vim'               " 様々なShougoプラグインを結合する
"Plug 'Shougo/vimproc.vim'
Plug 'Yggdroot/indentLine'            " indentを示す縦棒
" Plug 'airblade/vim-gitgutter'         " gitの差分の+-を左に表示
Plug 'bling/vim-bufferline'           " 開いているbufferをステータスバーに表示する
Plug 'cohama/lexima.vim'              " 括弧をスマートに
Plug 'easymotion/vim-easymotion'      " 移動をスマートに
Plug 'junegunn/vim-easy-align'        " テキスト整形=などに合わせる
Plug 'junegunn/vim-peekaboo'          " マクロとレジスタの中身を見る
Plug 'luochen1990/rainbow'            " 括弧がレインボー!!
Plug 'scrooloose/nerdtree'            " ファイルツリーを表示する
" Plug 'Xuyuanp/nerdtree-git-plugin'  " NERDTreeにgitの状態を表示
Plug 'simeji/winresizer'              " ウィンドウの大きさ変更
" Plug 'Markdown'                     " マークダウンを認識する
" Plug 'suan/vim-instant-markdown'    " マークダウンのプレビュー
Plug 'plasticboy/vim-markdown'        " 
Plug 'thinca/vim-quickrun'            " クイックランをする
Plug 'thinca/vim-fontzoom'            " フォントサイズを+-で変更する
Plug 'tpope/vim-fugitive'             " gitの操作
Plug 'tpope/vim-surround'             " 括弧やらで囲む
Plug 'tyru/caw.vim'                   " M-mでコメントトグル
Plug 'vim-airline/vim-airline'        " 便利なステータスバー
Plug 'vim-airline/vim-airline-themes' " airlineのスタイルの変更
Plug 'w0rp/ale'                       " シンタックスチェッカー
" Plug 'jacoborus/tender.vim'           " ColorScheme
Plug 'vim-scripts/taglist.vim'        " ctagsのジャンプ機能やツリー表示
Plug 'tpope/vim-speeddating'          " 日時をインクリメントデクリメントする
Plug 'mhinz/vim-startify'             " スタート画面をカスタマイズ
Plug 'raphamorim/lucario'
"Plug 'vim-scripts/TeTrIs.vim'
"Plug 'osyo-manga/vim-sound'
call plug#end()
"----------------------------------------(colorscheme)----------------------------
"colorscheme lucario

autocmd ColorScheme * hi Comment      ctermfg=44 ctermbg=NONE cterm=NONE guifg=#98fb98 guibg=NONE gui=NONE
autocmd ColorScheme * hi Cursor       cterm=NONE guifg=#2b3e50 guibg=#f8f8f2
autocmd ColorScheme * hi CursorLine   ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#405160 gui=NONE
autocmd ColorScheme * hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#405160 gui=NONE
autocmd ColorScheme * hi Search       ctermfg=23 ctermbg=186 cterm=NONE guifg=#2b3e50 guibg=#e6db74 gui=NONE

"------------------------------------プラグインのカスタマイズ----------------------------
"--------------------ale-----------------------------
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra'

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
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
"--------------------neosunippet----------------------
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
"--------------------airline----------------------
" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0

"--------------------NERDTree----------------------
" autocmd vimenter * NERDTree
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
"let g:NERDTreeChDirMode=1
nnoremap <silent><C-s> :NERDTreeToggle<CR>
nnoremap <silent><space>s :NERDTreeToggle<CR>
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
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
nmap <space>t <Plug>(easymotion-overwin-f2)
map <space>k <Plug>(easymotion-overwin-line)
map <space>w <Plug>(easymotion-overwin-w)
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
"--------------------peekaboo----------------------
let g:peekaboo_window='vert bo new'
"--------------------taglist----------------------
"set tags = tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags" " ctagsのコマンド
let Tlist_Show_One_File = 1 "現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1 "右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1 "taglistのウインドウだけならVimを閉じる
"map <silent> <space>c :TlistToggle<CR> " lでtaglistウインドウを開いたり閉じたり出来るショートカット
"--------------------startify----------------------
let g:startify_custom_indices = ['a', 's', 'd', 'f', 'g', 'h', 'l',';']
let g:startify_bookmarks = [ {'rc': '~/_vimrc'}]
let g:startify_custom_header = []
let g:startify_commands = [
    \ {'pu': 'PlugUpdate'},
    \ {'rr': 'h ref'},
    \ {'rs': 'h startify.txt'},
    \ ]
autocmd User Startified nmap <buffer> o <plug>(startify-open-buffers)
let g:startify_change_to_dir = 1
let g:startify_padding_left = 1
let g:startify_files_number = 9

"--------------------mineo----------------------
"mineo.dllを$VIMにいれて，mineo.vimを$VIM$vimfiles$にいれて，dictフォルダを＄VIMに入れる
"g/でローマ字でも日本語をサーチ
if has("migemo")
    set migemo
endif
"--------------------SE----------------------
" function
"if has('win32') || has ('win64')
"    function! PlaySE(name)
"        silent! exec '!start /b sox C:\Users\cs17064\Music\' . a:name . '.wav -t waveaudio'
"    endfunction
"
"    " 補完を閉じる
"    " autocmd CompleteDone * call PlaySE("shift")
"    " バッファ移動
"    autocmd BufEnter * call PlaySE("switch")
"    " 入力
"    " autocmd InsertCharPre * call PlaySE("input")
"    " 保存
"    autocmd BufWrite * call PlaySE("save")
"    " インサートモード IN / OUT
"    autocmd InsertEnter * call PlaySE("in")
"    autocmd InsertLeave * call PlaySE("out")
"    " text delete/yank
"    autocmd TextYankPost * call PlaySE("del")
"    " Vim 起動/終了
"    autocmd VimEnter * call PlaySE("ve")
"    autocmd VimLeave * call PlaySE("vl")
"    " カレントディレクトリが変更したとき
"    "autocmd DirChanged * call PlaySE("cd")
"endif
