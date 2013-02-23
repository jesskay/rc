" Fix runtimepath on windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" Global
filetype plugin indent on       " turn on all the filetype shit
syntax on                       " turn on syntax highlighting
set nocompatible                " because fuck vi
set titlestring=vim\ %{expand(\"%t\")} " set up what we want our title to be
if &term =~ "^screen"           " some magic to fix the window title in screen/tmux
  if &term == "screen-256color" " and this magic fixes ctrl+arrow
      set term=xterm-256color
  else
      set term=xterm
  endif
  set t_ts=k                  " these have to go after the rest, 'set term' resets them
  set t_fs=\
endif                           " Thanks Eevee!
set title                       " actually set the window title
set backspace=indent,eol,start  " backspace over anything
set nobackup                    " don't make backups
set writebackup                 " unless we're saving a file
set undodir=~/.vim/undo         " specify where to store persistent undo files
set undofile                    " turn on the persistent undo feature
set history=50                  " retain 50 lines of :command history
set laststatus=2                " show the status line always
set lazyredraw                  " don't update the screen when executing stored proceedures
set showmatch                   " briefly show matching brackets when inserting one
set matchtime=2                 " very briefly
set ruler                       " always display the cursor position
set showcmd                     " show commands as we type
set relativenumber              " show relative line numbers
set cursorline                  " highlight the line we're working on so we don't lose track of it
set hlsearch                    " highlight the search term so it's easier to find
set incsearch                   " search as we type
set ignorecase                  " case-insensitive searching
set smartcase                   " unless we explicitly use upper-case
set autoindent                  " preserve indentation level for newlines
set shiftwidth=4                " indent 4 spaces per level
set softtabstop=4               " indent 4 spaces per tab
set expandtab                   " don't use literal tab characters
set cpoptions+=J                " use double-spacing to demark sentence boundaries (per http://stevelosh.com/blog/2012/10/why-i-two-space/)
set fileformats=unix,dos        " prefer unix line endings, but begrudgingly permit dos line endings
set encoding=utf-8              " use unicode
setglobal fileencoding=utf-8    " I mean it, use unicode
set nobomb                      " don't use the BOM though, it's stupid and breaks things
set fileencodings=ucs-bom,utf-8,iso-8859-1 " detect when files are unicode
set wildmenu                    " zsh is awesome
set wildmode=full               " like seriously
set wildignore+=*.sw,__pycache__,*.pyc " ignore files we don't really care about
set autoread                    " if an unedited open file is changed, automatically reload it
set scrolloff=4                 " start scrolling early to avoid surprises and limit overscrolling
set hidden                      " permit hidden buffers to contain unsaved changes
let g:SuperTabDefaultCompletionType = "context" " figure out what completion type to use from context
set completeopt=menuone,longest,preview " make the completion really pretty and show docstrings
let mapleader = " "
let g:mapleader = " "
let maplocalleader = ","
let g:maplocalleader = ","
" some insert-mode undo voodoo from Eevee
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
set background=dark t_Co=256    " make sure vim knows my background is dark and my terminal can do 256 colors
colorscheme molokai             " prettify all the colors
" Override the background color from the colorscheme so I can still see my pretty background image in vim
hi Normal ctermbg=None
hi NonText ctermbg=None

" use jk to return to normal mode
inoremap jk <esc>
" disable <esc> so I can't get back into bad habits
inoremap <esc> <nop>
" disable arrow keys to enforce learning
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" quickly disable highlights
nnoremap <leader><backspace> :nohlsearch<cr>

" search for next empty line
nnoremap <leader>/ /^$<cr>

" double-space to (un)fold folds; normal space is useless
nnoremap <leader><space> za

" switch number mode
function! g:ToggleNumberingMode()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
    redraw  " needed for it to operate as intended in command-line mode
endfunc
noremap <F3> :call g:ToggleNumberingMode()<cr>
vnoremap <F3> :call g:ToggleNumberingMode()<cr>gv
lnoremap <F3> :call g:ToggleNumberingMode()<cr>
inoremap <F3> <C-o>:call g:ToggleNumberingMode()<cr>
cnoremap <F3> <C-r>=g:ToggleNumberingMode()?'':''<cr>

" Disable SuperTab in text files where it only gets in the way
au FileType text,none let b:SuperTabDisabled=1
au FileType text,none setlocal noautoindent

" SQL
au FileType sql let g:sql_type_default = 'postgresql'

" reST
au FileType rst setlocal textwidth=80
au FileType rst setlocal colorcolumn=80

" Python
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType python setlocal textwidth=80 foldmethod=indent
au FileType python setlocal colorcolumn=80
au BufNewFile *.py,*.pyw set fileformat=unix
hi BadWhitespace ctermbg=red guibg=red
au FileType python match BadWhitespace /^\t\+/
au FileType python match BadWhitespace /\s\+$/
au FileType python let python_highlight_all=1
au FileType python let python_slow_sync = 1

" HTML
au FileType html,xhtml,mako setlocal foldmethod=syntax
au FileType html,xhtml,mako setlocal shiftwidth=2 softtabstop=2
au BufNewFile *.html 0read ~/.vim/skel/html

" CSS
au FileType css setlocal foldmethod=syntax
au FileType css setlocal shiftwidth=1 softtabstop=1
au BufNewFile *.css 0read ~/.vim/skel/css

" Magic global settings that have to go after everything else
" (shamelessly stolen from Eevee's .vimrc, like most of these settings)
hi WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+\%#\@<!$/
