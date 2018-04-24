. "$AGLIB"/_safe_eval_setvar.sh

_trap_list() { [ -n "${1:+"${1#$}"}" ] || return 1; __trap_list="$(trap)"
  # Need to deal with ignored traps as those propagate to subshells and break -z check (awk/grep)
  if [ -z "$__trap_list" ] && ( trap ':' EXIT; [ -z "$(trap)" ]; ); then # Dash or other shell without POSIX trap support
    >&2 printf 'WARNING: %s\n' 'Trying to capture existing traps using a temporary file'
    __trap_file="$(_tempname)" || { unset __trap_file; return 12; };         # Output redirection first to create file
    { rm -f "$__trap_file"; unset __trap_file; trap; __trap_list="$(cat)"; } >"$__trap_file" <"$__trap_file"
  fi
  _safe_eval_setvar "$1" "$__trap_list"
} 3>&1
