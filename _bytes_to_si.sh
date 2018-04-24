# SI byte multiple constants
 KB=1000;  MB=$((1000 * KB));   GB=$((1000 * MB));   TB=$((1000 * GB));   PB=$((1000 * TB))

_bytes_to_si() {
  # TODO: _test_parse_num $1 || ...
  if [ $1 -ge $PB ]; then printf "%d${2-}%s" $(($1 / $PB)) PB
elif [ $1 -ge $TB ]; then printf "%d${2-}%s" $(($1 / $TB)) TB
elif [ $1 -ge $GB ]; then printf "%d${2-}%s" $(($1 / $GB)) GB
elif [ $1 -ge $MB ]; then printf "%d${2-}%s" $(($1 / $MB)) MB
elif [ $1 -ge $KB ]; then printf "%d${2-}%s" $(($1 / $KB)) kB
else printf %d "$1"
  fi
}
