"""
""" Vvamp's Neovimrc
"""

set nocompatible    " Distro hands off

set number	        " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set visualbell	    " Use visual bell (no beeping)

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

" Map screen clear(hightlighting) to Control + I
nnoremap <silent> <C-i> :noh <CR>

" Duplicate line shortcut
let @a='YP'
nnoremap <silent> <C-d> @a <CR>

set noshowmode " Hide the MODE. It's already in the statusline 

" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'scrooloose/nerdtree'	                        " File explorer in VIM
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "C++ Autocomplete
Plug 'itchyny/lightline.vim'                        "Lightline (Bottom Status bar)
Plug 'jiangmiao/auto-pairs'                         " Auto bracket/quote closer

" Colorthemes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

" Powerline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Colortheme 
"" True Color
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

"" Colortheme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material



nmap <F9> :NERDTreeToggle<CR>