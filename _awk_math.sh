# TODO Pass variables safely somehow?
_awk_math() { awk "BEGIN{s=sprintf(\"%.${2:-6}f\",(${1}));if(s ~ /\.[0-9]*0+\$/)sub(/\.?0+\$/,\"\",s);printf \"%s\" s}" \
  || { >&2 printf 'Error in expression: "%s"\n' "$1"; return 1; } }
