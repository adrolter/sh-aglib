_str_repeat() { awk 'END{for(i=0;i<'${2-0}';i++)printf "%s","'"$1"'"}' </dev/null; }
