# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zide && -z ${fpath[(r)${0:h}]} ]]
then
    fpath+=( "${0:h}" )
fi

typeset -g ZIDE_DIR=${0:h}

autoload -Uz \
    zide \
    .zide-any-to-user-module \
    .zide-colorify-module-name \
    .zide-countdown \
    .zide-compute-ice \
    .zide-store-ices \
    .zide-compile-module \
    .zide-get-mods \
    .zide-get-mod-ices \
    .zide-create \
    .zide-create-script \
    .zide-ice \
    .zide-setup-module

