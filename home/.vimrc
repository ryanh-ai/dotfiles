set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'ambv/black'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-obsession'
Plugin 'jpalardy/vim-slime'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
" Plugin 'chemzqm/vim-jsx-improve'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier'
Plugin 'mxw/vim-jsx'
"Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on	     " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Window Management
set t_RB=
set t_Co=256
set background=dark
let g:solarized_termcolors = 16
let g:solarized_contrast = "high"
colorscheme solarized
source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim
set splitbelow
set splitright
"split navigations
" TODO: Add Control + Up / Down / Left / Right
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" File Tree Setup
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:Powerline_symbols = 'fancy'

" Folding Configuration
"set foldmethod=indent
"set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Code Completion
let g:ycm_autoclose_preview_window_after_completion=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>?  :YcmCompleter GetDoc<CR>

" Code Commenter Settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code
let g:NERDDefaultAlign = 'left'
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Python Setups
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 | 
    \ set shiftwidth=4 |
    \ set textwidth=110 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
set encoding=utf-8
set showmatch
"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	exec(open(activate_this, 'r').read(), dict(__file__=activate_this))
EOF

let python_hightlight_all=1
syntax on
set nu



"Python Setup for vim-slime to send snippets to other windows
if !empty($TMUX)
	let g:slime_target = "tmux"
	let g:slime_paste_file = tempname()
	let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
	let g:slime_python_ipython = 1
endif

"Javascript / React / JSX Setup
let g:jsx_ext_required = 0
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG
autocmd BufWritePre *.jsx :normal gggqG
au BufNewFile,BufRead *.js,*.jsx
    \ set tabstop=2 |
    \ set softtabstop=2 | 
    \ set shiftwidth=2 |
    \ set textwidth=110 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
set encoding=utf-8
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


" Other Setups
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set backspace=indent,eol,start
set mouse=a

" Flag Unneeded Whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.cfn.json set ft=cfn_json
au BufRead,BufNewFile *.cfn.yml set ft=cfn_yaml
au BufRead,BufNewFile *.cfn.yaml set ft=cfn_yaml




