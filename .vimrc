set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
" vim-tmux navigation between panes
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
" Plug 'maksimr/vim-jsbeautify'
Plug 'sbdchd/neoformat'
" Plug 'ifokeev/vim-autoformat'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'

" xyntax
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'digitaltoad/vim-jade'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
"
" <--------- themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
" Plug 'tomasr/molokai'
" Plug 'vim-airline/vim-airline' 
" Plug 'vim-airline/vim-airline-themes'
" -----------> 

" pretty window resizer
" Plug 'zhaocai/GoldenView.Vim'
Plug 'roman/golden-ratio'

" engine
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'

" easytags for ctags 
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" move selected lines
Plug 'matze/vim-move'

Plug 'neomake/neomake'
Plug 'jaawerth/neomake-local-eslint-first'

Plug 'tpope/vim-fugitive'

"
call plug#end()

filetype plugin indent on    " required
syntax on

set background=dark
set t_Co=256
colorscheme jellybeans

set encoding=utf-8
set backupdir=~/.tmp,/tmp
set directory=~/.tmp,/tmp
set tags=./tags;
set path=./
set noswapfile

set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload
"
" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set relativenumber 

set autochdir
set statusline+=%F
set laststatus=2

set wrap linebreak nolist
set breakindent

" engine
set re=1

" folds 
set foldmethod=indent
set foldlevel=99

" enable the use of the mouse
set ttyfast
set mouse=a       

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Filetype stuff
" ================
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
au BufRead,BufNewFile *.conf setf dosini
au BufRead,BufNewFile Thorfile set filetype=ruby
autocmd FileType ruby,eruby,jade,yaml,markdown,conf set ai sw=2 sts=2 et
autocmd FileType vim,tex,yaml,markdown let b:autoformat_blacklist=1

" autocmd! FileType javascript, BufWritePost * Neomake

autocmd! BufWritePost * Neomake

" <-------- nerdtree stuff
augroup nerdtree_autocmd
  autocmd!
  autocmd VimEnter * NERDTree
augroup END
" --------------> 

" neoformat options
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_javascript_prettydiff = {
        \ 'exe': 'prettydiff',
        \ 'args': ['mode:"beautify"',
                 \ 'styleguide:"yandex"',
                 \ 'lang:"javascript"',
                 \ 'readmethod:"filescreen"',
                 \ 'endquietly:"quiet"',
                 \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }

let g:neoformat_enabled_javascript = ['prettydiff']
" let g:neoformat_enabled_jsx = ['jsbeautify']
" let g:neoformat_enabled_jsx = ['js-beautify']

let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat

function! ESLintFix()
  execute "!" . b:neomake_javascript_eslint_exe . " --fix %:p" 
  edit! %
  Neomake
endfunction

nnoremap <leader>el :call ESLintFix()<CR>

" autoformat debug
" let g:autoformat_verbosemode=1
" let g:formatters_javascript = [
"             \ 'jsbeautify_javascript',
"             \ 'jscs'
"             \ ]
" let g:formatters_jsx = g:formatters_javascript
" let g:formatters_javascript_jsx = g:formatters_jsx

" truecolor nvim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" nerdtree
let NERDTreeChDirMode=2
"
" Intent private methods
let g:ruby_indent_access_modifier_style = 'outdent'

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
let g:easytags_async = 1

" move key
let g:move_key_modifier = 'C'

" ctrlP ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Enable JSX Syntax Highlighing in javascript files
let g:jsx_ext_required = 0 
"<!--------------- mappings -----------> 

" autoformat please
noremap <expr> <F2> !exists('b:autoformat_blacklist') ? ':Neoformat<CR>' : 'gg=G'
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>b :buffers<cr>
nnoremap <leader>B :BufExplorerHorizontalSplit<CR>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" set blank line by enter
nnoremap <CR> O<Esc>

" Easy window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap ; :

map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

map <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g

let i = 1
while i <= 9
  execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile

" easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>
"
" better navigation of wrapped lines
nnoremap j gj
nnoremap k gk
