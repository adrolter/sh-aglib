_slurp() {
  case ${2:+set} in set) exec 3<"$2";; '') exec 3<&0; esac

  __slurp_temp=
  while IFS= read -r __slurp_line; do
    __slurp_temp="${__slurp_temp}${__slurp_line}
" # Trailing newline
  done <&3; __slurp_temp="${__slurp_temp}${__slurp_line}" # Remainder after last LF
  # TODO Validate $1
  eval "$1"='"$__slurp_temp"'
  unset __slurp_temp __slurp_line
}
