" ecompile.vim 
" Maintainer:   Marcin Biegun <biegun.m@gmail.com>
" Version:      0.1

if exists('g:ecompile') || &cp
  finish
endif
let g:ecompile = 1

map <F7> :call Ecompile()<CR>
func! Ecompile()
  :let ecompile_path = "/home/nagl/Projekty/st/pol-st/scripts/ecompile"
  :let abs_file_path = expand('%:p')
  :echo system("cd / ; ".ecompile_path." .".abs_file_path)
endfunc

