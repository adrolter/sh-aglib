. "$AGLIB"/_str_escape.sh

# "_str_evalescape $value" - prepends backslash, backtick/backquote, dollar-sign, and double-quote in $value with \ and wraps the result in double-quotes for use in eval'd double-quoted strings, ex: eval "printf %s\\n $(_safe_dqval "\$(date)")"
# WARNING: Do NOT wrap the output of this function in escaped double-quotes at the call site! WRONG: eval "echo \"$(_safe_dqval "\$(date)")\""
_str_evalescape() {
  case "${2:-"$1"}" in ''|*[![:alnum:]_]*) __streqt_delim="${3:-\"}"; esac
  case ${__streqt_delim+x} in x) printf %s "$__streqt_delim"; esac
  _str_escape "$1" \\ -- \\ \` \$ \"
  case ${__streqt_delim+x} in x) printf %s "$__streqt_delim"; esac
}
