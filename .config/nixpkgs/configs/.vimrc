" cargo install rg

filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'Yggdroot/indentLine'
  Plug 'dense-analysis/ale'
  Plug 'jacoborus/tender.vim'
  Plug 'jpo/vim-railscasts-theme'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'mhinz/vim-signify'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'rhysd/vim-clang-format'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'twinside/vim-hoogle'
  Plug 'vim-airline/vim-airline'
call plug#end()

colors railscasts
syntax on
set number relativenumber
set ff=unix
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set list
set listchars=tab:>-
set noswapfile
set nobackup

" ALE
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'cpp': ['clang-format', 'clangtidy']}
let g:ale_linters = {'cpp': ['clangd', 'clangtidy', 'cppcheck']}
let g:ale_c_parse_compile_commands = 1
let g:ale_c_gcc_options = ""
let g:ale_cpp_clang_options = ""
let g:ale_c_build_dir_names = ['build', 'build-x86/Debug', 'build-x86/Release', 'build-x86/LLVMDebug', 'build-x86/LLVMRelease']

" Repgrip and Fzf
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-t> :Files<Cr>
nnoremap <C-h> :Rg<Cr>
nnoremap <C-l> :BLines<Cr>
nnoremap <C-L> :Lines<Cr>

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Whitespace
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
