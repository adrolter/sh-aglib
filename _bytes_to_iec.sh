# IEC byte multiple constants
KiB=1024; MiB=$((1024 * KiB)); GiB=$((1024 * MiB)); TiB=$((1024 * GiB)); PiB=$((1024 * TiB))

_bytes_to_iec() {
  # TODO _test_parse_num $1 || ...
  if [ $1 -ge $PiB ]; then printf "%d${2-}%s" $(($1 / $PiB)) PiB
elif [ $1 -ge $TiB ]; then printf "%d${2-}%s" $(($1 / $TiB)) TiB
elif [ $1 -ge $GiB ]; then printf "%d${2-}%s" $(($1 / $GiB)) GiB
elif [ $1 -ge $MiB ]; then printf "%d${2-}%s" $(($1 / $MiB)) MiB
elif [ $1 -ge $KiB ]; then printf "%d${2-}%s" $(($1 / $KiB)) KiB
else printf %d "$1"
  fi
}
