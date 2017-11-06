call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
call plug#end()
set number
set wrapscan
set hlsearch
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
set listchars=tab:»-,trail:!,eol:↲,extends:»,precedes:«
noremap <C-j> <esc>
noremap! <C-j> <esc>
:set hidden
