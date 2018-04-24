# Determine if a string is parseable as a signed integer
_test_parse_int() { ( [ $((${1#+} + 0)) = "${1#+}" ] ) 2>/dev/null; }
