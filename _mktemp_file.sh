. "$AGLIB"/_mktemp_path.sh

_mktemp_file() ( path="$(_mktemp_path ${1+"$1"})"; set -C && umask 0177 || return 2; : >"$path" || return 1; printf %s "$path"; )
