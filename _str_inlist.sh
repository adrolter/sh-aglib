_str_inlist() {
  __sinlst_s="$1"; shift
  for __sinlst_i in "$@"; do case "$__sinlst_s" in "$__sinlst_i") return 0; esac; done
  unset __sinlst_s __sinlst_i
  return 1
}
