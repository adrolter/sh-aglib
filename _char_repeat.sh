# Efficiently write a $2-length stream of char $1
_char_repeat() { if [ "$1" = 0 ]; then printf %0"${2:-0}"d 0; else printf %0"${2:-0}"d | tr 0 "$1"; fi; }
