FROM jjmerelo/alpine-perl6
RUN apk update
RUN apk add git build-base sqlite  sqlite-libs  sqlite-dev
RUN zef install DBDish
RUN zef install https://github.com/melezhik/sparrowdo.git https://github.com/melezhik/sparky.git
RUN apk add bash
ENV PATH=/root/.rakudobrew/moar-nom/install/share/perl6/site/bin/:$PATH
ENV USER=sparky
RUN git clone https://github.com/melezhik/sparky.git
COPY entrypoint.sh  /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]
