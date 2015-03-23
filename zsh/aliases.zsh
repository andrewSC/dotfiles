# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gbd='git bd'
alias gcb='git cb'
alias gcm='git ci -m'
alias gcam='git ca'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias gdf='git df'
alias gdfh='git dfh'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias guu='git checkout master && git fetch upstream && git pull upstream master'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpr='command git push origin HEAD && make_me_a_pr'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias grt='git fetch upstream && git rebase upstream $(get_git_branch)'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

alias ka9='killall -9'
alias k9='kill -9'

# Sudo hack (https://wiki.archlinux.org/index.php/Sudo#Passing_aliases)
alias sudo='sudo '

# Update alias so it's more like Arch Linux
alias updatedb='/usr/libexec/locate.updatedb'

# Caladan <3
alias caladanup='VBoxManage startvm Arch\ Linux --type headless'

# fswatch
alias watch-ccn='cd ~/Dev/ccn && watcher ~/Dev/ccn/ sbelsky@dev23.be.lan:/var/www/vhosts/ccn/sandbox/'
alias watch-net='cd ~/Dev/be.net && watcher ~/Dev/be.net/ sbelsky@dev23.be.lan:/var/www/vhosts/network/sandbox/'

# Ctags indexer
alias tagall='sh /Users/crerar/.bash_scripts/tag_indexer_net.sh && sh /Users/crerar/.bash_scripts/tag_indexer_ccn.sh && sh /Users/crerar/.bash_scripts/tag_indexer_core.sh'
alias ptagall='sh /Users/crerar/.bash_scripts/tag_indexer_pro2_view.sh && sh /Users/crerar/.bash_scripts/tag_indexer_pro2_api.sh'

# Vagrant
alias vssh="ssh -p 2222 andrew@127.0.0.1"
alias dev23="cd ~/bodega/dev23 && vagrant up && vssh"

# Docker
alias dup="boot2docker up"
alias dps="boot2docker ps"
