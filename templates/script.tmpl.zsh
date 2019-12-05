#!/usr/bin/env zsh
# -*- mode: sh; sh-indentation: $shift; sh-basic-offset: $shift;$emacstabs -*-
# vim:ft=zsh:sw=$shift:sts=$shift$vimtabs:

# Copyright $year $user_name
# License: $license

# Type agnostic object – can be run as script or as a function,
# and also sourced.

# Run as script? ZSH_SCRIPT is a Zsh 5.3 addition
if [[ $0 != "$script_name" || -n $ZSH_SCRIPT ]]; then
    # Handle $0 according to the Zsh Plugin Standard:
    # http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
    0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
    0=${${(M)0##/*}:-$PWD/$0}
else
    0=${funcsourcetrace[-1]%:*}
fi

emulate -LR zsh
setopt extendedglob warncreateglobal typesetsilent noshortloops rcquotes
   
typeset $script_norm_name_DIR=${0:h}
fpath+=( $$script_norm_name_DIR )
path+=( $$script_norm_name_DIR )

# Load/setup the components
