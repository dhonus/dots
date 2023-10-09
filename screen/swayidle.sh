#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

exec swayidle -w \
    timeout 300 "$DIR/idle.sh" \
        resume "$DIR/de_idle.sh"
