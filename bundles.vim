" This file enables vundle and adds plugins.

" Find correct path to vim config
if (has('win32') || has('win64')) && &shellcmdflag =~ '/'
    let $BUNDLEPATH=expand($HOME.'/vimfiles/bundle')
else
    let $BUNDLEPATH=expand($HOME.'/.vim/bundle')
endif

" Enable vundle
set nocompatible
filetype off
set rtp+=$BUNDLEPATH/Vundle.vim/
call vundle#begin($BUNDLEPATH)

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" General plugins
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/matchit.zip'
Plugin 'altercation/vim-colors-solarized'

" Python-related plugins
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/python_match.vim'

" Finish vundle configuration
call vundle#end()
