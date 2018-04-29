. "$AGLIB"/_awk_math.sh

_floatsleep() {
  case ${2+set}${__fsleep_method+set} in '') __fsleep_method=$(for m in gnusleep usleep perl; do
    if _floatsleep 0.0 $m; then printf %s $m; break; fi
  done); esac
  case ${2+set} in '') set "$1" "$__fsleep_method"; esac
  case "$2" in
    gnusleep) 2>/dev/null command sleep "$1" ;;
    usleep)   2>/dev/null command usleep "$(_awk_math "$1 * 1000000" 0)" ;;
    perl)     2>/dev/null perl -MTime::HiRes -e"Time::HiRes::usleep $(_awk_math "$1 * 1000000" 0)" ;;
    *)        return 2
  esac
}

