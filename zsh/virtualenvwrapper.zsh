# Add and execute the virtualenvwrapper script
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dev
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.7
source /usr/local/bin/virtualenvwrapper.sh

export PROMPT_COMMAND="prompt"

chpwd() { eval "$PROMPT_COMMAND" }

function prompt()
{
  if [ "$PWD" != "$OLDPWD" ]; then
    test -e .venv && workon `cat .venv`
  fi
}
