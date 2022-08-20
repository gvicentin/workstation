call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'drewtempelmeyer/palenight.vim'

" Initialize plugin system
call plug#end()

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

" Line numbers
set number
set relativenumber

" Don't break lines
set nowrap

set guicursor=
set noerrorbells

" Enable to change buffers without saving them
set hidden

set hlsearch
set incsearch

set scrolloff=8

" set signcolumn=yes
set colorcolumn=80

" Color scheme
set background=dark
colorscheme palenight

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Config airline
let g:airline_theme = "palenight"
" Italics for color scheme
let g:palenight_terminal_italics=1

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.colnr = ' ㏇:'

" Transparency
hi Normal guibg=NONE ctermbg=NONE

" Remap
nnoremap <silent> <C-p> :FZF<CR>
