# SYNOPSIS

Run [Sparky](https://github.com/melezhik/sparky) as Docker container.

# USAGE

    $ docker pull sparky 

## Run application as docker container 

    $ docker run -d \
    -v $sparky-host-root:/home/sparky/.sparky/projects \
    -v $sparky-host-report-root:/home/sparky/.sparky/reports \  
    sparky

Where:

* `$sparky-host-root` - sparky root directory on host 
* `$sparky-host-root` - sparky reports directory on host 


For example:

    $ docker run -d \
    -v /home/melezhik/projects/sparky-bailador-projects:/home/sparky/.sparky/projects \
    -v /var/www/html/sparky-docker:/home/sparky/.sparky/reports \
    sparky

And then see what's going on either by:

    $ docker logs $image-id

Or:

    $ docker attach $image-id

## Setup your sparky projects

You should follow [sparky](https://github.com/melezhik/sparky) on how to do this.
Just be aware that as for projects that run on docker container directly you should ask `no_sudo`
option for sparrowdo:


    $ nano $sparky-host-root/my-project/sparky.yaml

    sparrowdo:
    - no_sudo: true    

## See the reports and builds

Builds:

    $ sqlite3 $sparky-host-root/db.sqlite3

Reports:

    $ ls -l $sparky-host-report-root/

# See also

[alpine-perl6](https://github.com/JJ/alpine-perl6) - base docker image 

# Author

Alexey Melezhik


