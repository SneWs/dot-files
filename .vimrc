set nocompatible

" Encodings
set encoding=utf-8
set fileencoding=utf-8

" Whitespace and such
set nowrap

" Project specific vimrc file support
set exrc

" Vundle Plugin Manager config and bootstrap

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Buffer explorer
Plugin 'jlanzarotta/bufexplorer'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Sweet status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes
Plugin 'flazz/vim-colorschemes'

" Language extensions
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Git integration
Plugin 'tpope/vim-fugitive'

" Intellisense
Plugin 'Valloric/YouCompleteMe'

" File handling
Plugin 'kien/ctrlp.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

filetype on

" General configuration

" Colors and other visual goodies
colorscheme molokai
let g:airline_theme='molokai'

" Statusbar config
set laststatus=2

" NERDTree config
map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeQuitOnOpen = 1

" Coding
syntax on
set tabstop=4 " Tab config
set shiftwidth=4
set expandtab

" YCM Config
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" Toggle h/cpp
nnoremap <A-o> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Fix backspace and allow it to modify 'anywhere'
set backspace=indent,eol,start

" Markdown related items
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" GVim
if has("gui_running")
    set guifont=Hack:h10
    set guioptions -=T
    set guioptions -=L
endif


