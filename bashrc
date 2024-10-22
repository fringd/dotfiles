PATH="/Users/rdobson/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/rdobson/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/rdobson/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/rdobson/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/rdobson/perl5"; export PERL_MM_OPT;
EDITOR="/usr/local/bin/nvim"
export PATH=$HOME/bin:$PATH

. $HOME/.alias

#git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion

  __git_complete gco _git_checkout
  __git_complete gb _git_branch
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use default

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export FZF_DEFAULT_COMMAND='fd --type f'
. $HOME/.sqsp-secrets


# save python virtualenvs here
export WORKON_HOME=~/.virtualenvs
 
# activate virtualenvwrapper shell functions
source /usr/local/bin/virtualenvwrapper.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
. ./.xraycredentials
