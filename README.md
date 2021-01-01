# SYNOPSIS

Run [Sparky](https://github.com/melezhik/sparky) as Docker container.

# USAGE

    $ docker pull melezhik/sparky 

## Run application as docker container 

    $ docker run -d -v $sparky-root:/home/sparky/.sparky/projects -p 3000:3000 melezhik/sparky

Where `$sparky-root` is a sparky root directory

For example:

    $ git clone  https://github.com/melezhik/sparky.git 
    $ docker run -d \
    -v $PWD/sparky/examples:/home/sparky/.sparky/projects \
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

## Sparky runtime setup

If you need to install additional software into Sparky container, create project `sparky-setup` inside `$sparky-root`
directory with `sparrowfile` inside:

    $ cat $sparky-root/sparky-setup/sparrowfile

    package-install 'open-ssl';
    zef 'Sparky::Plugin::Notify::Telegram', %( notest => True );
    zef ' Sparky::Plugin::Notify::Email', %( notest => True );
    # so on ...

This sparrowfile will be executed _at_ Sparky launch:

    $ docker run -d -v $sparky-root:/home/sparky/.sparky/projects -p 3000:3000 melezhik/sparky

## Setting sparky timeout

    docker run -e SPARKY_TIMEOUT=20 ...

# See also

[alpine-raku](https://github.com/JJ/alpine-raku) - base docker image 

# Author

Alexey Melezhik


