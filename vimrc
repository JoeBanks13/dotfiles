"
"               NeoVim Configuration File
"                  Authored by Joseph
"

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Colors
Plug 'agreco/vim-citylights'

" Plugins for everywhere
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'aurieh/discord.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'

" Linting & completion
Plug 'w0rp/ale'

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Load-on-command plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Elixir plugins
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Rust plugins
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Markdown plugins
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Elm plugins
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

call plug#end()
" }}}

" Definitions {{{

" ALE config
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
            \    'elixir': ['credo'],
            \ }

" Enable whitespace manager
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Racer configuration
let g:racer_cmd = "/home/joseph/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1

" }}}

" Configuration options {{{

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" Colors
colorscheme citylights

" Enable filetype
filetype plugin indent on

syntax on
set noshowmode
set incsearch
set number
set updatetime=100
set hidden
set foldlevel=99
set foldmethod=marker
set encoding=utf-8
set nocompatible
set signcolumn=yes

" Italics
let g:one_allow_italics = 1

set termguicolors

" Elixir config
let g:mix_format_on_save = 1

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Language specific overrides {{{
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
nmap <F9> :NERDTreeToggle<CR>
nmap <space> za

" Move between buffers using CTRL+Left/Right
map <C-Right> :bnext<CR>
map <C-Left>  :bprevious<CR>

" }}}

" Auto commands & highlighting {{{

" Close neovim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
