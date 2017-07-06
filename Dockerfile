FROM jjmerelo/alpine-perl6
ENV PATH=/root/.rakudobrew/moar-nom/install/share/perl6/site/bin/:$PATH
ENV USER=sparky
RUN apk update
RUN apk add git build-base sqlite  sqlite-libs  sqlite-dev bash
RUN zef install DBDish
RUN zef install https://github.com/melezhik/sparky.git
RUN zef install https://github.com/melezhik/sparrowdo.git
RUN git clone https://github.com/melezhik/sparky.git
COPY entrypoint.sh  /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]
