# SYNOPSIS

Build a docker image with the [Sparky](https://github.com/melezhik/sparky)

# USAGE

## Checkout the project

    $ git clone https://github.com/melezhik/sparky-docker.git

## Build image 

    $ docker build -t sparky .

## Run application as docker container 

    $ docker run -d \
    -v $sparky-host-root:/home/sparky/.sparky/projects \
    -v $sparky-host-report-root:/home/sparky/.sparky/reports \
    --entrypoint sparkyd sparky --timeout=10

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


# See also

[alpine-perl6](https://github.com/JJ/alpine-perl6) - base docker image 

# Author

Alexey Melezhik


