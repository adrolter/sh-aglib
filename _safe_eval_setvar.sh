. "$AGLIB"/_str_evalescape.sh

# "_safe_eval_setvar $name $value" - validates $name and sanitizes $value using _safe_dquoteval before setting the variable using eval
_safe_eval_setvar() { set "${1#$}" "$2"; case "$1" in ''|*[![:alnum:]_]*|[![:alpha:]_]*) return 1; esac
   eval "$1=$(_str_evalescape "$2" -d)"; }
