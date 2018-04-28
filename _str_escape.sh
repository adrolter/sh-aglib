# _str_escape "my $test\n string" (-- default)
# _str_escape "my $test\n string" \% (-- default)
# _str_escape "my $test\n string" -- \\ \" \' \$ \( \[
# _str_escape "my $test\n string" \\ -- \\ \" \' \$ \( \[
_str_escape() {
  for __stresc_p in "$@"; do case "$__stresc_p" in --) shift; break; esac; shift # ksh needs eval (why?)
    eval 'case ${__stresc_str+set} in "") __stresc_str="$__stresc_p"; continue; esac'
    eval 'case ${__stresc_esc+set} in "") __stresc_esc="$__stresc_p"; continue; esac'
  done
  [ -z ${__stresc_esc} ] && __stresc_esc=\\
  [ -z ${1+set} ] && set \\ \$ \" \' ' ' '	' '
'

  for __stresc_c in "$@"; do
    case ${#__stresc_c} in 1) :;; *) return 99; esac
    __stresc_newstr=
    while :; do
      __stresc_remain="${__stresc_str#*"${__stresc_c}"}"
      case "$__stresc_str" in "$__stresc_remain") __stresc_newstr="${__stresc_newstr}${__stresc_str}"; break;; esac
      __stresc_newstr="${__stresc_newstr}${__stresc_str%"${__stresc_c}${__stresc_remain}"}${__stresc_esc}${__stresc_c}"
      __stresc_str="$__stresc_remain"
    done
    __stresc_str="$__stresc_newstr"
  done
  printf %s "$__stresc_str"
  unset __stresc_p __stresc_str __stresc_esc __stresc_c __stresc_newstr __stresc_remain
}
