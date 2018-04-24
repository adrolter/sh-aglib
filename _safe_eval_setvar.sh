. "$AGLIB"/_safe_dqval.sh

# "_safe_eval_setvar $name $value" - validates $name and sanitizes $value using _safe_dquoteval before setting the variable using eval
_safe_eval_setvar() { set "${1#$}" "$2"; [ -z "$1" ] && return 1; case "$1" in *[![:alnum:]_]*|[![:alpha:]_]*) return 2;; esac
  eval "$1=$(_safe_dqval "$2")"; }
