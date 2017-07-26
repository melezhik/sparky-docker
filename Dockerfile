FROM jjmerelo/alpine-perl6
ENV PATH=/root/.rakudobrew/moar-nom/install/share/perl6/site/bin/:$PATH
ENV USER=sparky
RUN apk update
RUN apk add git build-base sqlite  sqlite-libs  sqlite-dev bash curl perl-dev procps py2-pip
RUN curl -s -kL http://cpanmin.us/ -o /bin/cpanm && chmod a+x /bin/cpanm
RUN cpanm  --notest https://github.com/melezhik/outthentic.git
RUN cpanm -q --notest https://github.com/melezhik/sparrow.git
RUN zef install DBDish
RUN zef install https://github.com/melezhik/sparrowdo.git --verbose
RUN zef install https://github.com/melezhik/sparky.git && echo OK
RUN git clone https://github.com/melezhik/sparky.git
COPY entrypoint.sh  /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]
