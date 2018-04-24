. "$AGLIB"/_awk_math.sh

_floatsleep() {
  if [ -z ${__floatsleep_method+set} ]; then __floatsleep_method=; for _ in gnusleep usleep perl; do
    if _floatsleep 0 $_; then __floatsleep_method=$_; break; fi
  done; fi
  [ -z ${2+set} ] && set "$1" "$__floatsleep_method"
  if [ "$2" = gnusleep ]; then 2>/dev/null command sleep "$1"
elif [ "$2" = usleep ]; then 2>/dev/null command usleep "$(_awk_math "$1 * 1000000" 0)"
elif [ "$2" = perl ]; then 2>/dev/null command perl -MTime::HiRes -e"Time::HiRes::usleep $(_awk_math "$1 * 1000000" 0)"
else return 1
  fi
}

