# "_str_only $string $chars" - returns 0 if $1 contains only characters found in $2
_str_only() { [ -z "$(printf %s "$1" | tr -d "$2")" ]; }
