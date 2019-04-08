
call plug#begin('~/.nvim/plugged')


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf' 
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'liuchengxu/space-vim-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'fenetikm/falcon'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'

Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

syntax on
filetype plugin indent on

set rtp+=/usr/local/opt/fzf
set clipboard+=unnamedplus 
set signcolumn=yes
set rnu
"set background=dark
set background=light
set termguicolors
set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu 
set lazyredraw
set showmatch
set incsearch
set hlsearch
set nolazyredraw
set timeoutlen=200
set completeopt=menuone
set scrolloff=5

"===== Variable bindings ==========
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['~/.local/bin/pyls'],
    \ }
let g:LanguageClient_useVirtualText=0

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:rustfmt_autosave = 1
let g:rust_use_custom_ctags_defs = 1  "ignore https://github.com/rust-lang/rust.vim/blob/master/ctags/rust.ctags 

if !exists('g:tagbar_type_rust')
   let g:tagbar_type_rust = {
       \ 'ctagstype' : 'rust',
       \ 'kinds' : [ "https://github.com/universal-ctags/ctags/blob/master/parsers/rust.c#L50-L61",
         \'M:macro,Macro Definition',
         \'P:method,A method',
         \'c:implementation,implementation',
         \'e:enumerator,An enum variant',
         \'f:function,Function',
         \'g:enum,Enum',
         \'i:interface,trait interface',
         \'m:field,A struct field',
         \'n:module,module',
         \'s:struct,structural type',
         \'t:typedef,Type Alias',
         \'v:variable,Global variable',
       \ ]
   \ }
endif


" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>3)

"====== Mappings ==========

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F6> :call LanguageClient#textDocument_rename()<CR>

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


colorscheme space_vim_theme
let g:airline_theme='monochrome'
"colorscheme onedark
"hi Normal guibg=NONE


" ======= Default Colorscheme fixes =========

" hi clear VertSplit
" hi clear TabLineFill
" hi clear TabLine
" hi clear TabLineSel
" hi TabLineSel guifg=Green
" hi VertSplit guifg=#444444
" hi Visual term=reverse cterm=reverse guibg=Darkgreen
" hi LineNr guifg=#444444
" hi CursorLineNr guifg=#333333
" hi NonText guifg=#333333
