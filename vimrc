" Disable VI compatibility
set nocompatible

" 16 color terminal
set t_Co=16

" Set the term title
set title

" Show line number and position
set number
set ruler

" Leave 3 line buffer
set scrolloff=3

" Enable syntax stuff
syntax on
filetype plugin indent on

" Show current mode
set showmode

" Fix backspace
set backspace=2

" Make Ctrl-T go to the next vim-tab
nmap <C-T> <ESC>:tabn<CR>

" Fix expansion mode
set wildmode=list:longest

" Incremental search
set incsearch
set ignorecase

" Show matching braces, etc.
set showmatch

" Make it smart
set smartindent
set smarttab
set smartcase
set autoindent

" Default to soft tab
set expandtab

" Default to 2 spaces per tab
set tabstop=4
set softtabstop=4
set shiftwidth=4


" Make Taglist update more often
set updatetime=750

" Set ctags
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'

" Enable file backup (atomic)
set directory=~/.vim/swap,/tmp,.
set backupdir=~/.vim/backup,/tmp,.
set backup
set writebackup

" Tlist configs
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" Scroll the view faster
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" Disable auto-fold in Erlang
let g:erlangFoldSplitFunction = 0

" Wildcard ignore some files
set wildignore+=*.o,*.pyc,*.beam,*.class,*~

" Make our shell interactive
set shellcmdflag=-ic

" Clear whitespace at the end
autocmd BufWritePre *.py :%s/\s\+$//e

" Disable folding
set nofoldenable

" Disable soft tabbing for HTML/CSS/JS
au BufNewFile,BufRead *.html setl noexpandtab
au BufNewFile,BufRead *.css setl noexpandtab
au BufNewFile,BufRead *.js setl noexpandtab

" Detect the markdown type
au BufNewFile,BufRead *.md,*.markdown,*.mdown setl filetype=markdown

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Causes split to make it below
set splitbelow

" Causes vsplit to split to the right
set splitright

