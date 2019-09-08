set nocompatible

" Encodings
set encoding=utf-8
set fileencoding=utf-8

" Temp and swap files
set noswapfile
set nobackup

" Whitespace and such
set nowrap
set formatoptions-=tc 

" Project specific vimrc file support
set exrc

" Vundle Plugin Manager config and bootstrap

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme) 
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-syntastic/syntastic'
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
Plugin 'whatyouhide/vim-gotham'
Plugin 'morhetz/gruvbox'

" Language extensions
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'craigemery/vim-autotag'
Plugin 'arrufat/vala.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Intellisense
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'

" File handling
Plugin 'kien/ctrlp.vim'
Plugin 'jremmen/vim-ripgrep'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

filetype on

" General configuration

" Disable automatic insertion of new lines since it's bonkers behavior.
set textwidth=0 wrapmargin=0

" Colors and other visual goodies
colorscheme gotham256 
let g:airline_theme='gotham256'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

" Statusbar config
set laststatus=2

" NERDTree config
map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeQuitOnOpen = 1

" Ctrl-P tweaks
let g:ctrlp_max_files=0

" Coding
syntax on
set tabstop=4 " Tab config
set shiftwidth=4
set expandtab
set number

noremap <leader>cr :pyf clang-rename.py<cr> " Clang rename
"map <C-I> :pyf clang-format.py<cr> " Clang format
"imap <C-I> <c-o>:pyf clang-format.py<cr> " Clang format 
noremap <leader>cf :pyf clang-format.py<cr> " Clang format 

" YCM Config
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=1
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jg :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>

" Toggle h/cpp
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Open BufExplorer
nnoremap <C-o> :BufExplorer<CR>

" Fix backspace and allow it to modify 'anywhere'
set backspace=indent,eol,start

" Markdown related items
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" GVim
if has("gui_running")
    set langmenu=en_US.UTF-8  
    set guifont=SourceCodeProForPowerline-Regular:h11
    set guioptions -=T
    set guioptions -=L
endif

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" disable folding
set nofoldenable

" Tweak the selection highlight
"hi Visual  guifg=#FF0000 guibg=#333333 gui=none 
highlight Visual cterm=bold ctermbg=Blue ctermfg=Black 

