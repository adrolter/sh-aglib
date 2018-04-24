_awk_cmp() { awk "BEGIN{if(!(${1}))exit 1}"; } # { >&2 printf 'Error in expression: "%s"\n' "$1"; return 9; } }
