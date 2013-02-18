# vim: set syntax=zsh:
# .zshrc: base zshrc, pulls in all other files
ZSHRC_ROOT=$HOME/.zshrc_files

source $ZSHRC_ROOT/aliases
source $ZSHRC_ROOT/functions
source $ZSHRC_ROOT/completion
source $ZSHRC_ROOT/history
source $ZSHRC_ROOT/misc
source $ZSHRC_ROOT/bindings
source $ZSHRC_ROOT/paths
source $ZSHRC_ROOT/prompt

# try to enter tmux, if in a term but not tmux
if [[ "$TERM" = "rxvt-unicode"* ]]; then
  if [[ -z "$TMUX" ]]; then
    tmux_tryattach shiftingbits
    exit
  fi
fi
if [[ "$TERM" = "screen" ]]; then
  export TERM=screen-256color
fi
