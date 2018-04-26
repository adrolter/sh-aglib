_str_replace() {
  # TODO decide on func signature (order of pararms)
  # TODO add "limit" paramter and break loop early if reached
  t="e" # search
  tlen=${#t}
  r="ee" # replace
  s="this is a test of the emergency broadcast system" # source

  new_s=
  while :; do
    a="${s#*"$t"}"
    #echo "s='$s'; a='$a'"
    case "$s" in "$a") new_s="${new_s}${s}"; break;; esac
    # TODO is it faster to printf in cmd sub for 2nd string ($s) or to remove $a from end of $s using ${s%"$a"} and simply concat it all?
    # Might depend on length of strings being dealt with?
    new_s="$(printf "%s%.$((${#s} - ${#a} - $tlen))s%s" "$new_s" "$s" "$r")"
    # ALT: new_s="${new_s}${s%"$t$a"}${r}"
    s="$a"
  done

  printf %s "$new_s"
}
