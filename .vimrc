set nocompatible
filetype off
set signcolumn=yes
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'aurieh/discord.nvim'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'majutsushi/tagbar'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHA!', 'GHD!']}
Plug 'joshdick/onedark.vim'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'mhinz/vim-startify'
Plug 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
set encoding=utf8
set guifont=UbuntuMono\ Nerd\ Font\ 11
syntax on
let g:airline_powerline_fonts=1
tnoremap <C-w>h <C-\><C-n><C-w>h

tnoremap <C-w>j <C-\><C-n><C-w>j

tnoremap <C-w>k <C-\><C-n><C-w>k

tnoremap <C-w>l <C-\><C-n><C-w>l

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }



nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

map <C-Right> :bnext<CR>
map <C-Left>  :bprevious<CR>

colorscheme onedark
set noshowmode
set incsearch
set number
set updatetime=100
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
set hidden
let g:racer_cmd = "/home/joseph/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[38;2;%lu;%lu;%lum"

call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ["rustc"]

set tabstop=4
set shiftwidth=4
set expandtab

" Language specific overrides
autocmd FileType typescript set ts=2 shiftwidth=2 sts=2 et

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

let g:ycm_server_python_interpreter = "/usr/bin/python2"
let g:ycm_python_binary_path = '/usr/bin/python3.6'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * wincmd l
