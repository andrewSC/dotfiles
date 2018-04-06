"don't notify me of errors when I open the file
let g:ale_lint_on_enter = 0

"show the error list automatically
let g:ale_open_list=1

"set the max line length for python files as well as ignore some things
let g:ale_python_pylint_options="--max-line-length=150 --disable=W,missing-docstring"

"autoclose the loclist if we're closing the buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
  augroup END
<
