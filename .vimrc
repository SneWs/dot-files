set nocompatible

" Encodings
set encoding=utf-8
set fileencoding=utf-8

" Temp and swap files
set noswapfile

" Whitespace and such
set nowrap
set formatoptions-=tc 

" Project specific vimrc file support
set exrc

" OmniSharp setup

" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 3

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_server_type = 'roslyn'
set completeopt=longest,menuone,preview

" Vundle Plugin Manager config and bootstrap

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

" Language extensions
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Git integration
Plugin 'tpope/vim-fugitive'

" Intellisense
Plugin 'Valloric/YouCompleteMe'
Plugin 'OmniSharp/omnisharp-vim'

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
set number
noremap <leader>cr :pyf /usr/bin/clang-rename.py<cr> " Clang rename
map <C-I> :pyf /usr/share/vim/addons/syntax/clang-format-3.9.py<cr> " Clang format
imap <C-I> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.9.py<cr> " Clang format 

" YCM Config
let g:ycm_complete_in_comments=0
let g:ycm_collect_identifiers_from_tags_files=1
"set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jg :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf : YcmCompleter GoToDefinition<CR>
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
    set guifont=Hack\ 11
    set guioptions -=T
    set guioptions -=L
endif

" Omnisharp continued...

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=0



