
_mktemp_path() ( for d in "${TMPDIR-}" /tmp /var/tmp .; do [ -n "$d" ] && [ -d "$d" ] && [ -w "$d" ] && { dir="$d"; break; }; done;
  [ -z ${dir+set} ] && return 1;
  for r in /dev/urandom /dev/arandom /dev/random; do [ -r "$r" ] && { randsrc="$r"; break; } done;
  [ -z ${randsrc+set} ] && return 2;
  while :; do path="${dir}/${1-"tmp."}$(od -An -N5 -tx1 ${randsrc} | tr -d ' ')"; [ -e "$path" ] || break; done
  printf %s "$path"; )
