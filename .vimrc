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
Plugin 'derekmcloughlin/gvimfullscreen_win32'
Plugin 'morhetz/gruvbox'

" Language extensions
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'craigemery/vim-autotag'
Plugin 'fatih/vim-go'

" Git integration
Plugin 'tpope/vim-fugitive'

" Intellisense

Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'

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

" Enable hybrid line numbers
set number
set relativenumber

" Colors and other visual goodies
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

" Make gruvbox use dark mode.
set background=dark
let g:gruvbox_contrast_dark='medium'

" Statusbar config
set laststatus=2

" Windows tweaks
"map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" NERDTree config
map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeQuitOnOpen = 1

" disable folding
set nofoldenable

" Ctrl-P tweaks
let g:ctrlp_max_files=0

" Coding
syntax on
set tabstop=4 " Tab config
set shiftwidth=4
set expandtab
set number

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Toggle h/cpp
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Open BufExplorer
nnoremap <C-o> :BufExplorer<CR>

" Fix backspace and allow it to modify 'anywhere'
set backspace=indent,eol,start

" Markdown related items
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" Clipboard tweaks
set clipboard=unnamedplus,unnamed

" GVim
if has("gui_running")
    let &guifont="Hack 12"
    set guioptions-=T
    set guioptions-=L
    "set guioptions-=m
    set guioptions-=r
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

" Ctrl-P tweaks
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.dll  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Tweak the selection highlight
"hi Visual  guifg=#FF0000 guibg=#333333 gui=none 
"highlight Visual cterm=bold ctermbg=Blue ctermfg=Black 


