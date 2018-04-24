. "$AGLIB"/_test_parse_int.sh

# Add two positive numbers without overflows
_safe_add() {
  [ -n "${1#-*}" ] || _ERR "_safe_add: Operand 1 must be positive"
  [ -n "${2#-*}" ] || _ERR "_safe_add: Operand 2 must be positive"
  # TODO allow for negative (or mixed) operands
  # * If both negative ensure result is not > 0
  # * If mixed ensure result is not > than the positive one
  # Validate operands using test (triggers error on overflow)
  _test_parse_int "$1" || _ERR "_safe_add: Failed parsing operand 1 (overflow?): ${1}"
  _test_parse_int "$2" || _ERR "_safe_add: Failed parsing operand 2 (overflow?): ${2}"
  # Validate result
  [ $(($1 + $2 < 0)) -eq 1 ] && _ERR "_safe_add: Overflow in (${1} + ${2})"
  printf %d $(($1 + $2))
}

