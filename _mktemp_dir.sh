. "$AGLIB"/_mktemp_path.sh

_mktemp_dir() ( path="$(_mktemp_path ${1+"$1"})"; umask 0077 || return 2; mkdir "$path" || return 1; printf %s "$path"; )
