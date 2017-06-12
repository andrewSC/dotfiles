# Setup GPG auto-commit signing
# https://gist.github.com/andrewSC/0969f4b0e0f553361f7dcff33f3ea611

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi


# Makes git auto completion faster favouring for local completions
__git_files () {
  _wanted files expl 'local files' _files
}
