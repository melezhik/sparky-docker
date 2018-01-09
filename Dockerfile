FROM jjmerelo/alpine-perl6
ENV PATH=/root/.rakudobrew/bin:/root/.rakudobrew/moar-master/install/share/perl6/site/bin:$PATH
ENV USER=sparky
RUN wget http://sparrowhub.org/bootstrap.sh -O - | sh
RUN apk add git build-base sqlite  sqlite-libs  sqlite-dev procps
RUN zef install https://github.com/melezhik/sparrowdo.git --/test
RUN zef install https://github.com/melezhik/sparky.git --/test
RUN git clone https://github.com/melezhik/sparky.git
COPY entrypoint.sh  /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]
EXPOSE 3000
