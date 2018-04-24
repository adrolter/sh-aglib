. "$AGLIB"/_mktemp_path.sh

_mktemp_pipe() { path="$(_mktemp_path ${1+"$1"})"; umask 0177 || return 2;
  mkfifo "$path" || mknod "$path" p || return 1; printf %s "$path"; }
