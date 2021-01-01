set -x
set -e

cd ~/sparky

if test -f ~/.sparky/projects/db.sqlite3; then 
    echo ~/.sparky/projects/db.sqlite3 exists
else
    raku db-init.raku
fi

nohup sparkyd &

raku bin/sparky-web.raku
