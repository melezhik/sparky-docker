# SYNOPSIS

Run [Sparky](https://github.com/melezhik/sparky) as a Docker container.

# WARNING

project is deprecated, please use this instead - https://github.com/melezhik/sparky/blob/master/docs/sparky_on_docker.md

# USAGE

    $ docker pull melezhik/sparky 

## Run application as a docker container 

    $ docker run -d -v $sparky-root:/root/.sparky/projects -p 3000:3000 melezhik/sparky

Where `$sparky-root` is a sparky root directory

For example:

    $ git clone  https://github.com/melezhik/sparky.git 
    $ docker run -d \
    -v $PWD/sparky/examples:/root/.sparky/projects \
    -p 3000:3000 melezhik/sparky

And then hit Sparky web ui:

    $ firefox 127.0.0.1:3000

You can also create container by docker-compose:

    # docker-compose -f docker-compose.yaml up

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

# See also

[Docker Alpine Linux](https://hub.docker.com/_/alpine) - Alpine docker image

# Author

Alexey Melezhik


