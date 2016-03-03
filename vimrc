execute pathogen#infect()

set nocompatible

" my preferred settings for text files, should be overridden if vim picks up
" the filetype
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80

syntax on
filetype plugin indent on

set t_Co=256
colorscheme elflord

set number
set noruler

set ignorecase
set smartcase

set hlsearch
set incsearch

set smarttab
set autoindent
set smartindent

set ttymouse=xterm2

set clipboard=unnamedplus

set backspace=indent,eol,start

set scrolloff=2
set sidescrolloff=2

set autoread

set nowritebackup               " don't bother making backups
set nobackup                    " ...let alone saving them
set directory=$HOME/.vim/swap// " stop littering .sw*s

set undofile                  " persistent undo!
set undodir=$HOME/.vim/undo//

set magic " less escaping

set listchars=tab:>-,trail:*

set list

set virtualedit=block,onemore

set hidden

set noerrorbells
set novisualbell

set wildmenu                            " get wild
set wildignorecase                      " like it sounds
set wildmode=longest:full               " prefix matching for wildmenu
set completeopt+=longest                " insert up to the matched prefix
set wildignore+=*.class,*.o,*.pyc,*.git " unlikely to want to match these

set guioptions= " for (blegh) gvim

set history=200
set cmdwinheight=20

set diffopt+=vertical

set tags=$WORKING_ENV/tags,./tags,tags " look in the dir of the open file, then in pwd

set laststatus=2 " always show the statusline

let mapleader = ","
let g:mapleader = ","

" *functions* {{{1
function! GrepFor()
	execute 'Rgrep '.expand("<cWORD>")
endfunction

function! GGrepFor()
	execute 'silent Ggrep '.expand("<cword>")
endfunction
" }}}

" *remaps* {{{1
noremap <Space> i
noremap Q q:

" see `:h si`
inoremap # X#
inoremap <F1> <Esc>
inoremap ,` <Esc>ysiW`

nmap <Leader>f :Rgrep <C-R><C-W>
nmap <Leader><Tab> :tabprevious<CR>
nmap <Leader><Leader><Tab> :tabnew<CR>

" menu on multiple ctags matches
" from http://stackoverflow.com/a/3614824/1251040
nnoremap <C-]> :execute 'tj' expand('<cword>')<CR>

" TODO: default to normal `gD` if we don't have a tags file
noremap gD <C-]>
" }}}

" *autocommands* {{{1
" see :help mkview
	au BufWinLeave *.py mkview
	au BufWinEnter *.py silent loadview

" see http://vim.wikia.com/wiki/Omnicomplete_-_Remove_Python_Pydoc_Preview_Window
autocmd FileType python set nosmartindent
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType gitcommit set spell
autocmd FileType gitrebase set spell

" *.dsl files are just uglier java
au BufRead,BufNewFile *.dsl setfiletype java

" and *.ipy is just python
au BufNewFile,BufRead *.ipy set filetype=python
" }}}

" vim:foldmethod=marker
" vim:noet:sw=2 ts=2
