_str_replace() {
  __strrep_str="$1"
  __strrep_substr="$2"
  __strrep_repstr="$3"
  __strrep_limit="${4:-0}"
  __strrep_method="${5:-paramsub}"

  case $__strrep_method in
    paramsub) __strrep_newstr=
      while :; do
         __strrep_remain="${__strrep_str#*"${__strrep_substr}"}"
         case "$__strrep_str" in "$__strrep_remain") __strrep_newstr="${__strrep_newstr}${__strrep_str}"; break;; esac
         __strrep_newstr="${__strrep_newstr}${__strrep_str%"${__strrep_substr}${__strrep_remain}"}${__strrep_repstr}"
         __strrep_str="$__strrep_remain"
         case $__strrep_limit in [!0])
           __strrep_i=$((${__strrep_i=0} + 1))
           case $__strrep_i in $__strrep_limit) __strrep_newstr="${__strrep_newstr}${__strrep_str}"; break; esac
         esac
       done
       printf %s "${__strrep_newstr}"
       unset __strrep_newstr __strrep_remain __strrep_i ;;
    sed)
       printf %s "$__strrep_str" \ # TODO: Fix - this will not escape regex special chars, need _str_pprepend $str '[\[(...]' '\\'
       | sed -e s/"$(_str_replace "$__strrep_substr" / '\/')"/"$(_str_replace "$__strrep_repstr" / '\/')"/g ;;
    *) return 5 ;;
  esac
  unset __strrep_str __strrep_substr __strrep_repstr __strrep_limit __strrep_method
}
