" Copyright (C) 2023  lifeich1 <lifeich0@gmail.com>
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <https://www.gnu.org/licenses/>.


if exists('g:loaded_fzf_gitmoji')
  finish
endif
let g:loaded_fzf_gitmoji = 1

let s:cpo_save = &cpo
set cpo&vim


command -bang Gmoji  call fzf_gitmoji#fzf#run(<bang>0)


let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=2 sw=2
