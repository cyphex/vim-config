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

" General plugins
Plug 'vim-syntastic/syntastic'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/matchit.zip'
Plug 'altercation/vim-colors-solarized'

" Python-related plugins
Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/python_match.vim'

" Finish vim-plug configuration
call plug#end()
