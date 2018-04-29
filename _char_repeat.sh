# Efficiently write a $2-length stream of char $1
_char_repeat() { case "$1" in 0) printf %0"${2:-0}"d 0;; *) printf %0"${2:-0}"d | tr 0 "$1"; esac; }
