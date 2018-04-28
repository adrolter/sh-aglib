# Pattern replace
_str_preplace() {
  __stprpl_str="$1"
  __stprpl_patstr="$2"
  __stprpl_repstr="$3"
  __stprpl_limit="${4:-0}"

  __stprpl_newstr=
  while :; do
    __stprpl_remain="${__stprpl_str#*${__stprpl_patstr}}"
    case "$__stprpl_str" in "$__stprpl_remain") __stprpl_newstr="${__stprpl_newstr}${__stprpl_str}"; break;; esac
    __stprpl_newstr="${__stprpl_newstr}${__stprpl_str%${__stprpl_patstr}"$__stprpl_remain"}${__stprpl_repstr}"
    __stprpl_str="$__stprpl_remain"
    case $__stprpl_limit in [!0])
      __stprpl_i=$((${__stprpl_i=0} + 1))
      case $__stprpl_i in $__stprpl_limit) __stprpl_newstr="${__stprpl_newstr}${__stprpl_str}"; break; esac
    esac
  done
  printf %s "$__stprpl_newstr"
  unset __stprpl_str __stprpl_patstr __stprpl_repstr __stprpl_limit __stprpl_newstr __stprpl_remain __stprpl_i
}

#pre="${s%$t"$a"}"; new_s="$(printf "%s%.${#pre}s%s" "$new_s" "$s" "$r")"
