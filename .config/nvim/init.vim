set number
" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
" set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set clipboard+=unnamedplus

set nocompatible
filetype plugin indent on

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-commentary'
    Plug 'lambdalisue/suda.vim'

    " Completion / linters / formatters
"    Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

ca w!! :SudaWrite
