" Disable VI compatibility
set nocompatible

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'armon/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jimenezrick/vimerl'
Bundle 'mileszs/ack.vim'
Bundle 'matchit.zip'
Bundle 'taglist.vim'
Bundle 'pep8'
Bundle 'localvimrc'
Bundle 'python.vim'
Bundle 'indent/python.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'LargeFile'
Bundle 'scrooloose/nerdcommenter'
Bundle "godlygeek/tabular"
Bundle 'tpope/vim-eunuch'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'jsbeautify'
Bundle 'amadeus/powerline-improved'
Bundle 'Lokaltog/vim-easymotion'
filetype plugin indent on

" 16 color terminal
set t_Co=16

" Set the term title
set title
set titlestring=%F

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
set laststatus=2

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

" More history
set history=100

" Store our undo file
set undodir=~/.vim/undo
set undofile

" Make Taglist update more often
set updatetime=750

" Enable file backup (atomic)
set directory=~/.vim/swap,/tmp,.
set backupdir=~/.vim/backup,/tmp,.
set backup
set writebackup

" Scroll the view faster
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" Wildcard ignore some files
set wildignore+=*.o,*.pyc,*.beam,*.class,*~

" Make our shell interactive
set shellcmdflag=-ic

" Prompts to save on quit
set confirm

" From http://vimcasts.org/episodes/tidying-whitespace/
" Preserves/Saves the state, executes a command, and returns to the saved state
" Modified from http://vimbits.com/bits/231
" Remove trailing whitespace on save
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Execute clear whitespace on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

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

" Nicer invisibles
set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" Setup a leader
let mapleader = ";"

" Fast saving
nmap <leader>w :w<cr>

" Splitting
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>

" Fullscreen
nmap <leader>f :set fu<cr>

" Disable Ex Mode
map Q <Nop>

" Remap jj to escape
inoremap jj <Esc>

" Allows %% to expand to the folder of the current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Configure syntastic
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['erlang', 'html'] }
let g:syntastic_javascript_jsl_conf = "-conf ~/.jslintrc"

" Set ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Tlist configs
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" Disable auto-fold in Erlang
let g:erlangFoldSplitFunction = 0

" Set powerline to use fancy symbols, and custom theme
let g:Powerline_symbols = "fancy"
let g:Powerline_theme = "custom"
let g:Powerline_colorscheme = "custom"
" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Setup ctrlp
let g:ctrlp_max_files = 10000
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>d :bdelete<cr>

" Optimize file searching
let g:ctrlp_custom_ignore = '\.git\|\.hg\|\.svn\|env\|.beam\|ebin\|deps\|\.eunit\|\.pyc' " Ignore version control
if has("unix")
    let g:ctrlp_user_command = {
                \   'fallback': 'find %s -type f | egrep -v ' . g:ctrlp_custom_ignore .' | head -' . g:ctrlp_max_files
                \ }
endif
let g:ctrlp_working_path_mode = 0 " Do not modify my path, bitch
let g:ctrlp_map = '<leader>t' " Just use leader-t
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'  " Put the cache in the vim folder
let g:ctrlp_jump_to_buffer = 1 " Do not jump to new tabs
map <leader>b :CtrlPBuffer<cr>

" Configure localvimrc
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Disable fancy shit for 'large' files
" that are > 50MB
let g:LargeFile = 50

" If we are in visual mode, we can use * to search for the selection
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Set the Gvim options
if has("gui_running")
    set guifont=Monaco:h14
    set columns=140
    set lines=40
    set sessionoptions=blank,buffers,curdir,folds,localoptions,options,resize,tabpages,winpos,winsize
    map <C-Z> :mksession! ~/.vim/.session <CR>
    map <C-X> :source ~/.vim/.session <CR>
    colorscheme molokai
    set fuopt+=maxhorz
    set guioptions=egmt
endif


