_str_inlist() { s="$1"; shift; for _ in "$@"; do [ "$s" = "$_" ] && return 0; done; return 1; }
