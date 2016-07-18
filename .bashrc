#!/bin/bash
#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[1;32m\]\u\[\e[1;36m\]@\[\e[0;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
if [[ "$TERM" == *rxvt* ]]; then
   exec zsh
fi

