# dotfile

## vim-plug installation

Installation
Download plug.vim and put it in the "autoload" directory.

Vim
Unix
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
You can automate the process by putting the command in your Vim configuration file as suggested here.

Windows (PowerShell)
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
