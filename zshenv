PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/eclipse # Path to eclipse
PATH=$PATH:$HOME/.cabal/bin # Path to cabal
PATH=$PATH:$HOME/.cabal-sandbox/bin # Path to project specific cabal sandbox
PATH=$PATH:$HOME/.dotfiles/bin # Path to own scripts
PATH=$PATH:`gem environment gemdir`/bin # Path to Ruby gems
PATH=$PATH:$HOME/bin # Path to local binaries
PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
export NODE_ENV="development"
export -U PATH # -U for deduplication
