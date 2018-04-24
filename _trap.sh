# "_trap $callback $signal..." - passes $signal as argument 1 to $callback, var prefix: "__trap_", ex: _trap 'echo $1' INT TERM EXIT
_trap() { __trap_cb="$1"; shift; for __trap_s in "$@" ; do trap "$__trap_cb $__trap_s" "$__trap_s"; done; unset __trap_cb __trap_s; }
