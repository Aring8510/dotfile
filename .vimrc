call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
call plug#end()
set number
set wrapscan
set hlsearch
set incsearch
set showmatch matchtime=1
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
set nobackup
"set cursorline
set listchars=tab:»-,trail:!,eol:↲,extends:»,precedes:«
"set foldmethod=indent
noremap <C-j> <esc>
noremap! <C-j> <esc>
:set hidden
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap <C-0> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
noremap <S-h>   ^
noremap <S-l>   $
noremap <space> %
