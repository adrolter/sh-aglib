# "_str_only $string $chars" - returns 0 if $1 contains only characters found in $2
_str_only() { case "${1##*[!${2}]*}" in '') return 1; esac; return 0; }
