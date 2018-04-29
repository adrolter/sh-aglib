. "$AGLIB"/_mktemp_path.sh
. "$AGLIB"/_safe_eval_setvar.sh
#emulate sh
_trap_list() {
  case "${1:+"${1#$}"}" in '') return 1; esac
  __trap_list="$(trap)"
  # Need to deal with ignored traps as those propagate to subshells and break -z check (awk/grep)
  case "${__trap_list:+x}${__trap_list##*"trap -- "[\'\"][!\'\"]*}" in
    x) :;;
    *)
      ( trap ':' EXIT; x="$(trap)"; case "{$x:+x}${x##*"trap -- "[\'\"][!\'\"]*}" in x) exit 0; esac; exit 1; ) || {
        # dash, zsh or other shell without POSIX trap support (no cmd substitution subshell handling for "trap" output)
        >&2 printf 'WARNING: %s\n' 'Trying to capture existing traps using a temporary file'
        __trap_file="$(_mktemp_path)" || { unset __trap_file; return 12; };
        __trap_setopt="$(set +o)"; set -C                                        # Output redirection first to create file
        { rm -f "$__trap_file"; unset __trap_file; trap; __trap_list="$(cat)"; } >"$__trap_file" <"$__trap_file"
        eval "$__trap_setopt"
      }
  esac
  _safe_eval_setvar "$1" "$__trap_list"
  unset __trap_list
}
