#!/bin/sh

AGLIB="$(dirname "$(dirname "$(readlink -f "$0")")")"

echo "$AGLIB"

# SOURCE FORMAT:
#
# AGLIB=/path/to/aglib
#
# . "$AGLIB"/_func_name_1.sh
# . "$AGLIB"/_func_name_2.sh

