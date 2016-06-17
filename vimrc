" Load Vundle (platform-independent, inspired by Vundle wiki)
if (has('win32') || has('win64')) && &shellcmdflag =~ '/'
    let $BUNDLEFILE=expand('$HOME/vimfiles/bundles.vim')
else
    let $BUNDLEFILE=expand('$HOME/.vim/bundles.vim')
endif
if filereadable($BUNDLEFILE)
    source $BUNDLEFILE
endif

"
" General settings
"
filetype plugin indent on
syntax on

set autoread
set background=dark
set display+=lastline                       " Display incomplete lines
set fileencodings=utf-8,latin1
set fillchars=""                            " Disable characters in separators
set hidden                                  " Switch buffers without saving
set history=1000                            " Plenty of history
set lazyredraw                              " No redraw while executing macros etc.
set list
set listchars=tab:›\ ,trail:•,extends:#
set number                                  " Enable line numbering
set ruler
set scrolloff=5                             " Keep lines visible at the viewport edge
set shellslash                              " Use forward slashes even on windows
set showcmd
set showmatch                               " Indicate matching brackets
set showmode                                " Display current mode
set smarttab
set splitbelow                              " Open split windows below current
set splitright                              " Open vsplit windows right of current
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

"
" Custom mappings and plugin configuration
"

map <F2> :NERDTreeToggle<CR>

" Airline configuration
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

" Python mode
let g:pymode_python = 'python3'
let g:pymode_rope = 0
