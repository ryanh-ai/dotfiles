set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set expandtab
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
filetype plugin on
set term=builtin_ansi
set fileformats=dos,unix,mac
set t_Co=256
set background=dark
set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on
