"""""""""""""""""""""""""""""""""""
"""			       """
"""     Vvamp's Neovimrc       """
"""			       """
"""""""""""""""""""""""""""""""""""

" General Settings 
set nocompatible			" Distro hands off
set exrc				" Load project vimrc 
set relativenumber number	        " Show line numbers
set guicursor=				" Always have the block cursor
set mouse=a				" Enable mouse clicking 
set nohlsearch				" Don't highlight all search results 
set incsearch				" Search for string incrementally
set showmatch				" Highlight matching brace 
set hidden				" Keep buffer loaded in background 
set nowrap				" Don't wrap text, move buffer right 
set autoindent				" Auto indent new lines 
set ruler				" Show row and column ruler information
set undolevels=1000			" 1000 Undos
set noerrorbells			" No error sounds 
set tabstop=4 softtabstop=4		" Tabs are 4 spaces 
set shiftwidth=4			" Auto indent spaces 
set smartindent				" Smart indent 
set smarttab				" Smart use tabs 
set encoding=utf-8			" Set file encoding 
set foldmethod=indent			" A fold is when the same indents are used 
set noshowmode				" Hide the MODE. It's already in the statusline 
set backspace=indent,eol,start		" Backspace behaviour 
set scrolloff=8				" Start scrolling when reaching an offset of 8
set cmdheight=1				" More lines in command

"" Undo Settings -- These removes the swap files and keeps changes in an undodir
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir 
set undofile 


" Key Bindings 
"" Bind shift+i to format
nmap <S-i> :Neoformat<CR>

"" Map screen clear(hightlighting) to Control + I
nnoremap <silent> <C-i> :noh <CR>

"" Bind Capital R with replace all
nnoremap R :%s//g<Left><Left>

"" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Bind F9 to nerd tree
nmap <F9> :NERDTreeToggle<CR>

"" Bind F4 to systemwide-clipboard 
let g:usingSystemClipboard = "no"
function! s:SwitchClipboard() 
    if g:usingSystemClipboard ==? "yes"
	execute "set clipboard-=unnamedplus" 
	execute "echo \"Systemwide clipboard: [DISABLED]\""
	let g:usingSystemClipboard="no"
    else
	execute "set clipboard+=unnamedplus" 
	execute "echo \"Systemwide clipboard: [ENABLED]\""
	let g:usingSystemClipboard="yes"
    endif 
endfunction
nmap <F4> :call <SID>SwitchClipboard()<CR>


" Plugins
call plug#begin('~/.nvim/plugged')

    "" Essential Plugins 
    Plug 'scrooloose/nerdtree'											" File explorer in VIM
    Plug 'jiangmiao/auto-pairs'											" Auto bracket/quote closer
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }		" Live Markdown Preview
    Plug 'sbdchd/neoformat'											" Formatting
    Plug 'SirVer/ultisnips'											" Snippet Engine
    Plug 'honza/vim-snippets'											" Snippets	
    Plug 'neomake/neomake'											" Syntax Highlighting Latex

    "" Language Support 
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	" Autocomplete
    Plug 'deoplete-plugins/deoplete-jedi'				" Python Autocomplete 
    Plug 'dense-analysis/ale'						" C++ Lintinng
    Plug 'Shougo/deoplete-clangx'					" C++ Autocomplete
    Plug 'lervag/vimtex'


    "" Aesthetics
    Plug 'itchyny/lightline.vim'					" Lightline (Bottom Status bar)
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }		" Material Color Theme 

call plug#end()


" Plugin Settings 
"" Lightline -- Set lightline theme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ } 

" Colortheme(Material)
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
    \ 'c': ['clang'],
    \ 'html': ['alex']
\}

""" General Formatting 
""""Enable alignment
let g:neoformat_basic_format_align = 1

"""" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

"""" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"""" Mute non-fatal output
let g:neoformat_only_msg_on_error = 1

""" HTML Formatting 
let g:neoformat_enabled_html = ['jsbeautify']

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

"" Jedi path for discordpy
let g:deoplete#sources#jedi#extra_path = ['/home/vvamp/.local/lib/python3.9/site-packages/discord']

""" Snippets
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'firefox.exe'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'


""" Syntax Highlighting

""" LaTeX
call neomake#configure#automake('nrwi', 500)

"""" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

""" Windows ONLY 
let g:python3_host_prog = "C:\\Users\\Vvamp\\AppData\\Local\\Programs\\Python\\Python39\\python.exe"
