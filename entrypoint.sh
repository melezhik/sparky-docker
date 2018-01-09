#!/bin/bash

set -e
cd sparky

if ! test -f /home/sparky/.sparky/projects/db.sqlite3; then
  perl6 db-init.pl6
fi

BAILADOR=host:0.0.0.0 perl6 bin/sparky-web.pl6 </dev/null &>/dev/null &

sparkyd

