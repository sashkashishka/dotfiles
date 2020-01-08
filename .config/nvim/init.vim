call plug#begin('~/.local/share/nvim/plugged')

  " Functionality
  Plug 'pangloss/vim-javascript'                                    " js syntax
  Plug 'evanleck/vim-svelte'                                        " svelte.js support
  Plug 'maxmellon/vim-jsx-pretty'                                   " jsx syntax pretty
  Plug 'Shougo/denite.nvim'                                         " unite all interfaces
  Plug 'w0rp/ale'                                                   " asynchronous lint engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " intellisense engine
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder
  Plug 'junegunn/fzf.vim'                                           " fuzzy finder wrapper
  Plug 'tpope/vim-fugitive'                                         " git wrapper
  Plug 'tpope/vim-commentary'                                       " fast comment line
  Plug 'editorconfig/editorconfig-vim'                              " .editorconfig support
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-surround'                                         " surroundings

  " Appearance
  Plug 'danilo-augusto/vim-afterglow'                               " colorscheme
  Plug 'vim-airline/vim-airline'
  Plug 'Yggdroot/indentLine'                                        " indentation
  Plug 'scrooloose/nerdtree'                                        " file structure
  Plug 'ryanoasis/vim-devicons'                                     " web dev icons
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                    " colors for NERDTree
  Plug 'jiangmiao/auto-pairs'                                       " insert or delete brackets, parens, quotes in pair
  Plug 'edkolev/tmuxline.vim'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'                          " relative line numbers

call plug#end()

syntax on

set number
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set copyindent      " copy indent from the previous line
set termguicolors   " use gui colors
set clipboard+=unnamedplus
set backupcopy=yes
set cursorline

let g:afterglow_inherit_background=1
let g:afterglow_italic_comments=1
colorscheme afterglow
set fillchars+=vert:\|
hi vertsplit guifg=fg guibg=bg
let g:airline_powerline_fonts=1
let g:airline_mode_map={'n':'N','i':'I','R':'R','v':'V','V':'V'}
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_left_alt_sep='|'
let g:airline_right_alt_sep='|'
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.whitespace=''
let g:airline_detect_spell=''

autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', 'node_modules$', '.DS_Store', '.cache$', 'coverage$', '.idea$']
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

autocmd Filetype json let g:indentLine_enabled = 0
autocmd Filetype json set conceallevel=0
autocmd Filetype markdown let g:indentLine_enabled = 0
autocmd Filetype markdown set conceallevel=0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'css': ['eslint'],
\}
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
let g:ale_completion_enabled = "1"
let g:ale_sign_column_always = "1"
let g:airline#extensions#ale#checking_symbol=""
let g:airline_skip_empty_sections=1

highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#c9e881 guibg=#2b2b2b
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#e5766f guibg=#2b2b2b

let g:airline#extensions#ale#enabled=1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:polyglot_disabled = ['jsx']

" Coc settings
" @see https://github.com/neoclide/coc.nvim#example-vim-configuration
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=1000
set shortmess+=c
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)

setlocal spell spelllang=en_us
