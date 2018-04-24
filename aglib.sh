#!/bin/sh

AGLIB="$(dirname "$(readlink -f "$0")")"

__func="${1%.sh}"; shift

. "${AGLIB}/${__func}.sh"

trap 'DONE=1' INT
printf '%s\n' 'PRE COMMANDS:'
DONE=0; while [ $DONE -ne 1 ] && read l; do eval "$l"; done
printf '\n--------\n'
trap -- - INT; unset DONE

"$__func" "$@"

printf '\n\n%s return: %d\n' "$__func" $?

trap 'DONE=1' INT
printf -- '--------\n'
printf '%s\n' 'POST COMMANDS:'
DONE=0; while [ $DONE -ne 1 ] && read l; do eval "$l"; done
printf '\n--------\n'
trap -- - INT; unset DONE
