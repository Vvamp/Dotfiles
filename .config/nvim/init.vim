"""""""""""""""""""""""""""""""""""
"""			       """
"""     Vvamp's Neovimrc       """
"""			       """
"""""""""""""""""""""""""""""""""""

" General Settings 
set nocompatible    " Distro hands off

set relativenumber number	        " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set visualbell	    " Use visual bell (no beeping)
set mouse=a	    " Enable mouse in vim
set foldmethod=indent
set hlsearch	    " Highlight all search results
set smartcase	    " Enable smart-case search
set ignorecase	    " Always case-insensitive
set incsearch	    " Searches for strings incrementally
set encoding=utf-8
set autoindent	    " Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set ruler	        " Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set noshowmode " Hide the MODE. It's already in the statusline 


" Key Bindings 
"" Map screen clear(hightlighting) to Control + I
nnoremap <silent> <C-i> :noh <CR>

"" Duplicate line shortcut
let @a='YP'
nnoremap <silent> <C-d> @a <CR>

"" Bind Capital R with replace all
nnoremap R :%s//g<Left><Left>

"" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Bind F9 to nerd tree
nmap <F9> :NERDTreeToggle<CR>

" Plugins
call plug#begin('~/.nvim/plugged')

    "" Essential Plugins 
    Plug 'scrooloose/nerdtree'											" File explorer in VIM
    Plug 'jiangmiao/auto-pairs'											" Auto bracket/quote closer
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}	" Live Markdown Preview
    Plug 'sbdchd/neoformat'											" Formatting

    "" Language Support 
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	" Autocomplete
    Plug 'deoplete-plugins/deoplete-jedi'				" Python Autocomplete 
    Plug 'dense-analysis/ale'					" C++ Lintinng
    Plug 'Shougo/deoplete-clangx'					" C++ Autocomplete

    "" Aesthetics
    Plug 'itchyny/lightline.vim'					" Lightline (Bottom Status bar)
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }		" Material Color Theme 

call plug#end()



" Plugin Settings 

"" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"" Colortheme(Material)
""" Enable True Color
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

""" Enable various settings and set colortheme 
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

"""Set current cursor line color to orange 
highlight CursorLineNr guifg=orange


"" Language Support
""" Deoplete  
let g:deoplete#enable_at_startup = 1

""" Enabled linters 
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

""" C++ Formatting 
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

"" Markdown Preview 
let g:mkdp_auto_start = 0 " Autostart markdown preview when opening markdown file 
let g:mkdp_auto_close = 1 " Autoclose markdown preview when closing markdown file 


