" ========================================
" Vim plugin configuration
" ========================================
set rtp+=~/.vim/pluggies/
call plug#begin('~/.vim/plugged')

" This fork of YADR's pluggies are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/pluggies/ to edit them:

runtime languages.pluggie
runtime git.pluggie
runtime appearance.pluggie
runtime textobjects.pluggie
runtime search.pluggie
runtime project.pluggie
runtime vim-improvements.pluggie

" The plugins listed in ~/.vim/.pluggies.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.pluggies.local"))
  source ~/.yadr/vim/.pluggies.local
endif

call plug#end()
