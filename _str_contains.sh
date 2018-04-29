
_str_contains() { case ${2:+x} in '') return 0; esac; case ${2:+x} in x) case "${1##*"${2}"*}" in '') return 0; esac; esac; return 1; }

