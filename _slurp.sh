_slurp() {
  case "$1" in ''|*[![:alnum:]_]*|[![:alpha:]_]*) return 1; esac
  case ${2:+set} in set) exec 3<"$2";; '') exec 3<&0; esac
  case ${3:-cmdsub} in
    cmdsub) eval $1='"$(dd status=none <&3)"' ;;
    read) eval $1=''
      while IFS= read -r __slurp_line; do eval $1='"${'${1}'}${__slurp_line}
"'
      done <&3; eval $1='"${'${1}'}${__slurp_line}"' # Remainder after last LF
      unset __slurp_line ;;
    *) return 3;
  esac
}
