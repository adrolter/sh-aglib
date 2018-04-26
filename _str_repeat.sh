. "$AGLIB"/_char_repeat.sh

# Fancy string repeat
# Note: we use = to compare numbers for speed
_str_repeat2() {
  s="$1"
  count="$2" # _test_parse_int ?
  method="$3"
  strlen=${#1}
  # TODO Auto-select method based on string length and count
  # Use awk when $count > 500 ? (only for long strings?) UNLESS printf is a builtin, then use printf-seq until ~800 or more?
  # Use awk when $strlen > ?
  # Most important aspect is to reduce iterations as much as possible to reduce builtin/external command calls
  if [ -z "$method" ]; then
     if [ $strlen = 1 ]; then method=char
   else return 4
     fi
  fi
  [ ${4-0} = 1 ] && >&2 printf 'Source: "%s"\nLength: %d\nCount: %d\nMethod: %s\n' "$s" $strlen $count "$method"
  case "$method" in
          char) _char_repeat "$1" $count; echo ;;
    printf-seq) for i in $(seq $count); do printf %s "$s"; done ;;
        static) case $count in # TODO Source a seperate file of compiled case statement from 2-100+
                  2) printf %s "$s$s" ;;
                  3) printf %s "$s$s$s" ;;
                  4) printf %s "$s$s$s$s" ;;
                  5) printf %s "$s$s$s$s$s" ;;
                  6) printf %s "$s$s$s$s$s$s" ;;
                  7) printf %s "$s$s$s$s$s$s$s" ;;
                  8) printf %s "$s$s$s$s$s$s$s$s" ;;
                  9) printf %s "$s$s$s$s$s$s$s$s$s" ;;
                 10) printf %s "$s$s$s$s$s$s$s$s$s$s" ;;
                 11) printf %s "$s$s$s$s$s$s$s$s$s$s$s" ;;
                 12) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 13) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 14) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 15) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 16) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 17) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 18) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 19) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                 20) printf %s "$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s$s" ;;
                esac
              ;;
          eval) t=; while :; do case ${#t} in $offset) break;; esac; t="$t\$s"; done; eval "printf %s \"$t\"" ;;
       awk-var) awk -v s="$s" 'BEGIN{for(i=0;i<'${count}';i++)printf "%s",s}' ;;
      awk-pipe) awk 'BEGIN{for(i=0;i<'${count}';i++)printf "%s",s}' ;;
    concat-seq) t=; for i in $(seq $count); do t="$t$s"; done; printf %s "$t" ;;
    perl-slurp) perl -0777pe '$_=$_ x '$count ;;
             *) return 3;;
  esac
}

# TODO String builder using a fifo
# Background process (awk? dd?) reading from pipe, building a string efficiently in memory, then dumping it back to pipe
# to be read back into main context variable somehow?
