" Disable VI compatibility
set nocompatible

" Setup Plug
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'armon/vimerl'
Plug 'matchit.zip'
Plug 'taglist.vim'
Plug 'pep8'
Plug 'localvimrc'
Plug 'indent/python.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdcommenter'       " Easily (un)comment
Plug 'godlygeek/tabular'              " Tabularize
Plug 'tpope/vim-markdown'             " Parsing for Markdown
Plug 'jtratner/vim-flavored-markdown' " Parse Github-style Markdown
Plug 'mattn/webapi-vim'               " Used for Gist
Plug 'mattn/gist-vim'                 " Upload Gist
Plug 'airblade/vim-gitgutter'         " Git Diff in Gutter
Plug 'fatih/vim-go'                   " Golang integration
Plug 'fatih/vim-hclfmt'               " HCL formatting
call plug#end()

" Setup the vim extensions for Go
set rtp+=$GOROOT/misc/vim

" 256 color terminal
set t_Co=256

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
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups
set wildignore+=*.o           " Ignore C/C++ object files
set wildignore+=*.beam        " Ignore Erlang beam
set wildignore+=*.class       " Ignore Java class
set wildignore+=node_modules  " Ignore npm install directory
set wildignore+=*~            " Ignore backup files

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
set noswapfile
set directory=~/.vim/swap,/tmp,.
set backupdir=~/.vim/backup,/tmp,.
set backup
set writebackup

" Scroll the view faster
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" Make our shell interactive
" set shellcmdflag=-ic

" Allow switching away from changed buffers
set hidden

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
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Detect the salt type
au BufNewFile,BufRead *.sls setl filetype=yaml

" Auto format go code
" autocmd BufWritePre *.go Fmt

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

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

" Use <leader> ss to re-run the syntax highlights
nnoremap <leader>ss :syntax sync fromstart<cr>:redraw!<cr>

" Configure syntastic
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['erlang', 'html'] }
let g:syntastic_javascript_jsl_conf = "-conf ~/.jslintrc"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_python_checkers = ['python', 'pyflakes']

" Set ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Tlist configs
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" Disable auto-fold in Erlang
let g:erlangFoldSplitFunction = 0

" Setup Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Setup ctrlp
let g:ctrlp_max_files = 10000
nmap <leader>b :CtrlPBuffer<cr>

" Optimize file searching
let g:ctrlp_custom_ignore = '\\.vagrant\|\\.git\|\\.hg\|\\.svn\|env\|.beam\|ebin\|deps\|\\.eunit\|node_modules\|\\.pyc$\|\\.o$'
if has("unix")
    let g:ctrlp_user_command = {
                \   'fallback': 'find %s -type f | egrep -v ' . g:ctrlp_custom_ignore .' | head -' . g:ctrlp_max_files
                \ }
endif
let g:ctrlp_working_path_mode = 0 " Do not modify my path, bitch
let g:ctrlp_map = '<leader>t' " Just use leader-t
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'  " Put the cache in the vim folder
let g:ctrlp_jump_to_buffer = 1 " Do not jump to new tabs

" Configure localvimrc
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Configure clang complete
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

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

" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" Gitgutter
let g:gitgutter_highlights = 0
let g:gitgutter_all_on_focusgained = 0
nnoremap <silent> <leader>j :GitGutterNextHunk<cr>
nnoremap <silent> <leader>k :GitGutterPrevHunk<cr>

" Setup vim-go to automatically do imports
let g:go_fmt_command = "goimports"

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

" Terminal mode
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    colorscheme molokai
    tnoremap <esc> <C-\><C-n>
    nnoremap <Leader>c :terminal <CR>
endif

