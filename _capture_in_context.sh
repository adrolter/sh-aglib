. "$AGLIB"/_mktemp_path.sh
. "$AGLIB"/_safe_eval_setvar.sh

# Subshell-less stdout capture
_capture_in_context() { unset __ret__; while {
    __capctx_tmpfile="$(_mktemp_path)"
    __capctx_setopts="$(set +o)"
    set -C; { rm -f "$__capctx_tmpfile" || { __ret__=$?; break; }
      eval "$2"; __ret__=$?; __capctx_output="$(cat)"
    } >"$__capctx_tmpfile" <"$__capctx_tmpfile"
    eval "$__capctx_setopts" || { __ret__=$?; break; }
    _safe_eval_setvar "$1" "$__capctx_output" || { __ret__=$?; break; }
  break; } do :; done
  unset __capctx__tmpfile __capctx_setopts __capctx_output
  return ${__ret__:-0}
}
