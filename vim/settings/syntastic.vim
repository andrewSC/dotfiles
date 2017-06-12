"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
"enable JS checkers
let g:syntastic_javascript_checkers=['jshint', 'jscs']

" Default to eslint. If you need jshint, you can override this in
" ~/.vimrc.after
let g:syntastic_javascript_checkers = ['eslint']

"set the line length for python
let g:syntastic_python_checkers = ['flake8', 'python', 'pyflakes']
let g:syntastic_python_flake8_args='--ignore=E501 --max-line-length=100'
let g:syntastic_python_pylint_post_args="--max-line-length=100"

" I have no idea why this is not working, as it used to
" be a part of syntastic code but was apparently removed
" This will make syntastic find the correct ruby specified by mri
function! s:FindRubyExec()
    if executable("rvm")
        return system("rvm tools identifier")
    endif

    return "ruby"
endfunction

if !exists("g:syntastic_ruby_exec")
    let g:syntastic_ruby_exec = s:FindRubyExec()
endif
