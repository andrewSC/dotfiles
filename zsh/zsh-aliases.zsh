# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

# modified version of: https://github.com/Attamusc/dotfiles/blob/master/bin/git-pr
function make_me_a_pr() {

local current_tty="$(tty)";
local repo_owner=$(git config --get remote.origin.url | perl -nle "print $& if m{(\w*?)(?=\/)}");

  if [ -z "$1" ]; then
    echo "ERROR: A base branch is required."
    return 0
  fi

  if [ -z "$2" ]; then
    echo "Creating pull request against $1..."
    hub pull-request -o -b $1 -h "$repo_owner:$(get_git_branch)" > $current_tty
  else
    echo "Creating pull request against @@$1@@ from @@$2@@..."
    hub pull-request -o -b $1 -h $2 > $current_tty
  fi
}

# Git branch delete. Not only should it delete the local but the remote should be deleted as well.
function gbd() {
  git bd $1

  local remote=$(git remote show -n origin | grep Fetch | grep -Eo "git.*")
  local remote_branch_exists=$(git ls-remote --heads $remote $1 | wc -l)

  if [ $remote_branch_exists -eq 1 ]; then
    git push origin --delete $1
  fi
}

# Get the current branch name
function get_git_branch() {
  local branch_name

  branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
  branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
  branch_name="(unknown)"

  printf $branch_name
}

# ptpb.pw create paste from stdin
function pbc() {
  curl -F "c=@${1:--}" https://ptpb.pw/
}

# ptpb.pw create paste from specified file (which is given as url to some file on the internet)
function pbs() {
  url=$1
  filename=$(basename "$url")
  filelocation="/tmp/$filename"
  wget -O "$filelocation" "$url"
  pbc "$filelocation"
}

# ptpb.pw url minifier/shortener (which is given in stdin)
function pbm() {
  print $1 | curl -F "c=@-" https://ptpb.pw/u
}
