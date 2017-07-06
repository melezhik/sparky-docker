FROM jjmerelo/alpine-perl6
ENV PATH=/root/.rakudobrew/moar-nom/install/share/perl6/site/bin:$PATH
RUN apk git
RUN zef install https://github.com/melezhik/sparrowdo.git https://github.com/melezhik/sparky.git
