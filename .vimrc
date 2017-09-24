filetype plugin indent on
syntax on

colorscheme default
hi Search cterm=NONE ctermfg=black ctermbg=yellow
 
" Show partial commands in the last line of the screen
set showcmd
" Better command-line completion
set wildmenu
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Display line numbers on the left
set number
" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set noexpandtab
set shiftwidth=4
set tabstop=4

set undofile
set undodir=~/.vim/undodir

set relativenumber!

set path=$PWD/**

cmap w!! w !sudo tee > /dev/null %

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>v viw<CR>
nnoremap <Leader>V viW<CR>
nnoremap <Leader>y yiw<CR>
nnoremap <Leader>Y yiW<CR>
nnoremap <Leader><Leader> :ls<CR>:b<Space>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>f :find<Space>
nnoremap <Leader>s :mksession!<Space>.vimsession<CR>
nnoremap <Leader>S :mksession!<Space>.vimsession<CR>:wq<CR>
nnoremap <Leader>r ye:%s/<C-r>"//g<left><left>

map <C-J> :bprevious<CR>
map <C-K> :bnext<CR>

function! g:ToggleBothNums()
  if &relativenumber && &number
    set norelativenumber nonumber
  else
    set relativenumber number
  endif
endfunction

nnoremap <silent> <leader>nr :set relativenumber!<cr>
nnoremap <silent> <leader>na :set number!<cr>
nnoremap <silent> <leader>nn :call g:ToggleBothNums()<cr>

function! g:OffRelNumPreserve()
  let w:preserved_rnu = &relativenumber
  let w:preserved_nu = &number

  if &relativenumber || &number
    set number norelativenumber
  endif
endfunction

function! g:RestoreRelNum()
  if exists('w:preserved_rnu')
    let &relativenumber = w:preserved_rnu
  endif
  if exists('w:preserved_nu')
    let &number = w:preserved_nu
  endif
endfunction

au WinLeave * call g:OffRelNumPreserve()
au WinEnter * call g:RestoreRelNum()

set wildmode=longest,list,full
set wildmenu

set backupcopy=yes


autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
"Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'w0rp/ale'

call plug#end()

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '!'
let g:ale_sign_warning = '#'
nmap <silent> <C-h> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)

let g:jsx_ext_required = 0

let g:easytags_async = 1
let g:easytags_languages = {
			\   'javascript': {
			\     'cmd': 'jsctags',
			\	    'args': [],
			\	    'fileoutput_opt': '-f',
			\	    'stdout_opt': '-f-',
			\	    'recurse_flag': '-R'
			\   }
			\}

let g:airline_theme='base16_eighties'

