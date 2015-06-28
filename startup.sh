#! /bin/bash
set -e

# Start services
service nginx restart
service php5-fpm restart

# Back to bash
while ( true )
    do
    echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
    sleep 1
    /bin/bash
done
