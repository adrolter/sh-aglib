# Determine if a string is parseable as a signed integer
_test_parse_int() { ( case $((${1#+} + 0)) in "${1#+}") exit 0; esac; exit 1 ) 2>/dev/null; }
