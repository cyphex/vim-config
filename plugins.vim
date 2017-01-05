" This file enables the plugin manager and adds plugins.
" Currently, vim-plug is used

" Find correct path (platform-independent, inspired by Vundle wiki)
if (has('win32') || has('win64')) && &shellcmdflag =~ '/'
    let $BUNDLEPATH=expand($HOME.'/vimfiles/bundle')
else
    let $BUNDLEPATH=expand($HOME.'/.vim/bundle')
endif

" Enable vim-plug
call plug#begin($BUNDLEPATH)

" GENERAL PLUGINS
" ===============

" UI plugins
Plug 'vim-airline/vim-airline'          " Fancy status line
Plug 'bling/vim-bufferline'             " Buffer overview

" Project navigation and management
Plug 'scrooloose/nerdtree'              " File browser
Plug 'tpope/vim-fugitive'               " Git integration

" General editing
Plug 'tpope/vim-surround'               " Manipulate surrounding brackets etc.
Plug 'vim-scripts/matchit.zip'          " Better %-matching, e.g. for HTML tags
Plug 'vim-syntastic/syntastic'          " Code checking

" Colorschemes
Plug 'altercation/vim-colors-solarized'

" LANGUAGE-/FILETYPE-SPECIFIC PLUGINS
" ===================================

" Python
Plug 'davidhalter/jedi-vim'             " Autocompletion
Plug 'tmhedberg/SimpylFold'             " Folding
Plug 'vim-scripts/python_match.vim'     " %-matching for if/else etc.

" Git
Plug 'tpope/vim-git'                    " Syntax, indent etc.

" Finish vim-plug configuration
call plug#end()
