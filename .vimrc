"
"               NeoVim Configuration File
"                  Authored by Joseph
"

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Plugins for everywhere
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'aurieh/discord.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'Valloric/YouCompleteMe'
Plug 'ntpeters/vim-better-whitespace'

" Load-on-command plugins
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHA!', 'GHD!']}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Elixir plugins
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" i3 config plugins
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }

" Rust plugins
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" TypeScript plugins
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': 'typescript' }

" CSS/SCSS plugins
Plug 'chrisbra/Colorizer', { 'for': ['css', 'sass', 'scss'] }

" Python plugins
Plug 'ehamberg/vim-cute-python', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }


call plug#end()
" }}}

" Definitions {{{

" Enable powerline fonts
let g:airline_powerline_fonts=1

" Enable whitespace manager
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" ctags tagbar integrations
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

" YouCompleteMe config
let g:ycm_server_python_interpreter = "/usr/bin/python2"
let g:ycm_python_binary_path = '/usr/bin/python3.6'

" Neomake configuration
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ["cargo"]

" Racer configuration
let g:racer_cmd = "/home/joseph/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" }}}

" Configuration options {{{

" Enable filetype
filetype plugin indent on

syntax conceal on
set noshowmode
set incsearch
set number
set relativenumber
set updatetime=100
set hidden
set foldlevel=99
set foldmethod=marker
set encoding=utf-8
set nocompatible
set signcolumn=yes

" Set color scheme
colorscheme onedark

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Language specific overrides {{{
autocmd FileType typescript set ts=2 sw=2 sts=2 et
autocmd FileType elixir set ts=2 sw=2 sts=2 et
" }}}
" }}}

" Keymaps {{{

" Window moving
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" Line mode, tagbar, nerdtree, colorizer and folding shortcuts
nmap <F7> :set relativenumber!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :ColorToggle<CR>
nmap <space> za

" Move between buffers using CTRL+Left/Right
map <C-Right> :bnext<CR>
map <C-Left>  :bprevious<CR>

call neomake#configure#automake('w')

" }}}

" Auto commands & highlighting {{{

" Close neovim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
