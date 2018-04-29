_str_substr() {
  s="$1"
  offset="$2" # _test_parse_int ?
  length="$3"
  method="$4"
  strlen=${#1}
  # TODO Auto-select method based on string length and count
  # TODO Remove or convert to case
  [ ${5-0} = 1 ] && >&2 printf 'Source: "%s" (%d)\nOffset: %d\nLength: %d\nMethod: %s\n' "$s" $strlen $offset $length "$method"
  # TODO: Shorten method strings to single character to speed up matching
  case "$method" in
  printf-from0) printf %.${length}s "$s" ;; # Only (and always) use if $offset = 0
   eval-static) eval "case ${__match_any_${offset}+set} in " ;; # TODO finish
        static) case $offset in
                  # TODO Source a seperate file of compiled case statement from 2-100+
                  #   ...or build it with eval and cache the result string
                  1) printf %.${length}s "${s#?}" ;;
                  2) printf %.${length}s "${s#??}" ;;
                  3) printf %.${length}s "${s#???}" ;;
                  4) printf %.${length}s "${s#????}" ;;
                  5) printf %.${length}s "${s#?????}" ;;
                  6) printf %.${length}s "${s#??????}" ;;
                  7) printf %.${length}s "${s#???????}" ;;
                  8) printf %.${length}s "${s#????????}" ;;
                  9) printf %.${length}s "${s#?????????}" ;;
                 10) printf %.${length}s "${s#??????????}" ;;
                 11) printf %.${length}s "${s#???????????}" ;;
                 12) printf %.${length}s "${s#????????????}" ;;
                 13) printf %.${length}s "${s#?????????????}" ;;
                 14) printf %.${length}s "${s#??????????????}" ;;
                 15) printf %.${length}s "${s#???????????????}" ;;
                 16) printf %.${length}s "${s#????????????????}" ;;
                 17) printf %.${length}s "${s#?????????????????}" ;;
                 18) printf %.${length}s "${s#??????????????????}" ;;
                 19) printf %.${length}s "${s#???????????????????}" ;;
                 20) printf %.${length}s "${s#????????????????????}" ;;
                esac
              ;;
 printf-cmdsub) printf %.${length}s "${s#"$(printf %.${offset}s "$s")"}" ;;
   printf-eval) t=; while :; do case ${#t} in $offset) break;; esac; t="$t?"; done; eval "printf %.${length}s \"\${s#$t}\"" ;;
             *) return 3
  esac
}
