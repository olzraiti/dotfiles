execute pathogen#infect()
filetype plugin indent on
syntax on

colorscheme delek
 
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

cmap w!! w !sudo tee > /dev/null %

nnoremap <A-j> :tabprevious
nnoremap <A-k> :tabnext

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>v viw<CR>
nnoremap <Leader>V viW<CR>
nnoremap <Leader>y yiw<CR>
nnoremap <Leader>Y yiW<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
map <Leader><Leader> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
