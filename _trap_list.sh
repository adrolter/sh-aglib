. "$AGLIB"/_capture_in_context.sh
. "$AGLIB"/_safe_eval_setvar.sh

_trap_list() {
  __trap_list="$(trap)"
  case "${__trap_list:+x}${__trap_list##*"trap -- "[\'\"][!\'\"]*}" in
    x) _safe_eval_setvar "$1" "$__trap_list" ;;
    *) # If no unignored traps were captured test the shell's $(trap) behavior and use workaround if it fails
      ( trap ':' EXIT; x="$(trap)"; case "{$x:+x}${x##*"trap -- "[\'\"][!\'\"]*}" in x) exit 0; esac; exit 1; ) || {
        >&2 printf 'WARNING: %s\n' "Shell's \"\$(trap)\" construct is not POSIX-compliant"
        _capture_in_context "$1" 'trap'; }
  esac
  unset __trap_list
}
