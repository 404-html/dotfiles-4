
call plug#begin('~/.nvim/plugged')

" Plug 'neomake/neomake'
" Repace with ALE
"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf' 
" Markdown
Plug 'plasticboy/vim-markdown'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Toggle Neomake error list
Plug 'milkypostman/vim-togglelist'


Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

call plug#end()

syntax on
filetype plugin indent on

set rtp+=/usr/local/opt/fzf
set clipboard+=unnamedplus 
"set cursorline
set rnu
set background=dark
set termguicolors
set hidden
set tabstop=2
set softtabstop=2
set expandtab
set wildmenu 
set lazyredraw
set showmatch
set incsearch
set hlsearch
set timeoutlen=200


"===== Variable bindings ==========
let g:airline_theme = 'monochrome'
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>3)


"====== Mappings ==========
nnoremap <SPACE> <Nop>
map <Space> <leader>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>b :BufExplorer<CR>

silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

" Visual line navigation instead of real lines
nnoremap j gj
nnoremap k gk

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" TagBar
nmap <F8> :TagbarToggle<CR>

" ======= Colorscheme fixes =========

hi Visual term=reverse cterm=reverse guibg=Darkgreen
hi LineNr guifg=#444444
hi CursorLineNr guifg=#333333



