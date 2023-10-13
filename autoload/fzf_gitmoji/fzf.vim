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

let s:cpo_save = &cpo
set cpo&vim

function! s:sink_add(line)
  let word = split(a:line, ':')[1]
  let cur = getcurpos()
  let txt = getline('.')
  let txt = txt[:cur[2]-1] . ":" . word . ":" . txt[cur[2]:]
  call setline('.', txt)
  let cur[2] = cur[2] + len(word) + 2
  call setpos('.', cur)
endfunction

function! fzf_gitmoji#fzf#run(...)
  return fzf#run(fzf#wrap({
        \ 'source': 'gitmoji list',
        \ 'sink': function('s:sink_add'),
        \ }, 1))
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=2 sw=2
