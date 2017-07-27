# SYNOPSIS

Run [Sparky](https://github.com/melezhik/sparky) as Docker container.

# USAGE

    $ docker pull melezhik/sparky 

## Run application as docker container 

    $ docker run -d -v $sparky-host-root:/home/sparky/.sparky/projects sparky

Where `$sparky-host-root` is a sparky root directory on the host 


For example:

    $ docker run -d \
    -v /home/melezhik/projects/sparky-bailador-projects:/home/sparky/.sparky/projects \
    -p 3001:3001 sparky

And then hit Sparky web ui:

    $ firefox 127.0.0.1:3000

## Tailing Sparky daemon logs:

    $ docker logs -t -f $image-id

## Setup your sparky projects

You should follow [sparky](https://github.com/melezhik/sparky) on how to do this.
Just be aware that as projects gets built on docker container directly you should ask `no_sudo`
option for sparrowdo:


    $ nano $sparky-host-root/my-project/sparky.yaml

    sparrowdo:
    - no_sudo: true    

## Setting sparky timeout

    docker run -e SPARKY_TIMEOUT=20 ...

## Preserve reports

You may mount Sparky reports directory to preserve reports:
 
    $ docker run -d \
    -v /home/melezhik/projects/sparky-bailador-projects:/home/sparky/.sparky/projects \
    -v /home/melezhik/sparky-report/:/home/sparky/.sparky/reports \
    -p 3001:3001 sparky

# See also

[alpine-perl6](https://github.com/JJ/alpine-perl6) - base docker image 

# Author

Alexey Melezhik


