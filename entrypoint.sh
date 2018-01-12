#!/bin/bash

set -e

cd sparky

if ! test -f /home/sparky/.sparky/projects/db.sqlite3; then
  perl6 db-init.pl6
fi

if test -f /home/sparky/.sparky/projects/sparky-setup/sparrowfile; then
  echo "running sparky runtime setup from /home/sparky/.sparky/projects/sparky-setup/sparrowfile ..."
  sparrowdo --nosudo --local_mode --sparrowfile /home/sparky/.sparky/projects/sparky-setup/sparrowfile \
  --format=production
fi

#BAILADOR=host:0.0.0.0 perl6 bin/sparky-web.pl6 </dev/null &>/dev/null &

#sparkyd

