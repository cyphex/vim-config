set nocompatible

" Load plugin manager (platform-independent, inspired by Vundle wiki)
if (has('win32') || has('win64')) && &shellcmdflag =~ '/'
    let $BUNDLEFILE=expand('$HOME/vimfiles/plugins.vim')
else
    let $BUNDLEFILE=expand('$HOME/.vim/plugins.vim')
endif
if filereadable($BUNDLEFILE)
    source $BUNDLEFILE
endif

" GENERAL SETTINGS
" ================

filetype plugin indent on
syntax on

let mapleader=","

set autoread
set background=dark
set display+=lastline                       " Display incomplete lines
set fileencodings=utf-8,latin1
set fillchars=""                            " Disable characters in separators
set foldlevelstart=99                       " Generally start with all folds open
set hidden                                  " Switch buffers without saving
set history=1000                            " Plenty of history
set lazyredraw                              " No redraw while executing macros etc.
set list
set listchars=tab:›\ ,trail:•,extends:#     " Special chars for tabs, trailing spaces etc.
set number                                  " Enable line numbering
set ruler                                   " Display line and column numbers
set scrolloff=5                             " Keep lines visible at the viewport edge
set shellslash                              " Use forward slashes even on windows
set showcmd
set showmatch                               " Indicate matching brackets
set showmode                                " Display current mode
set smarttab
set splitbelow                              " Open split windows below current
set splitright                              " Open vsplit windows right of current
set noswapfile
set wildmenu                                " Better command-line completion
set wildignore+=*.aux,*.git
set wildmode=list:longest,full              " Tab-complete longest common part, then all

" Searching
set hlsearch                                " Highlight search patterns
set ignorecase
set incsearch                               " Show matches while typing
set smartcase                               " Override 'ignorecase' when pattern contains uppercase

" Editing and formatting
set autoindent                              " Copy indentation from previous line
set backspace=2                             " Allow backspacing over indents, eol and insert start
set cpoptions+=$
set expandtab                               " Spaces instead of tabs
set formatoptions+=tcqrj                    " Auto-wrap text and comments, format comments with "gq"
                                            " and insert comment leader on newline
set modeline                                " Read file-specific settings
set pastetoggle=<F12>                       " Toggle paste option
set shiftwidth=4                            " Indentation step size
set softtabstop=4
set tabstop=4

" GUI
if has('gui_running')
    set guioptions=""                       " Disable all menus etc in gvim
    set guifont=Consolas:h10
    silent! colorscheme solarized
endif

" Statusline
if has('statusline')
    set laststatus=2

    set statusline=%n)\                     " Buffer number
    set statusline+=%<%f\                   " Filename
    set statusline+=%M%W%H%R                " Options
    set statusline+=\ [%{&ff}/%Y]           " Line-endings and filetype
    set statusline+=\ [%{getcwd()}]         " Current directory
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right-aligned nav info
endif

" Strip trailing whitespace on save
autocmd BufWritePre * call StripTrailingWhitespace()
function! StripTrailingWhitespace()
    " Remember search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Remove whitespace
    %s/\s\+$//e

    " Restore previous state
    let @/=_s
    call cursor(l, c)
endfunction

" PLUGIN CONFIGURATION AND MAPPINGS
" =================================

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'VL',
    \ '' : 'VB',
    \ 's'  : 'S',
    \ 'S'  : 'SL',
    \ '' : 'SB',
    \ }

" Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'S'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 's'

" LANGUAGE-/FILETYPE-SPECIFIC CONFIGURATION
" =========================================

" Python
let g:jedi#force_py_version = 3
let g:syntastic_python_checkers = ['flake8', 'pydocstyle']
