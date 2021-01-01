FROM jjmerelo/alpine-raku

ENV BAILADOR=host:0.0.0.0,port:3000

USER root

RUN apk add bash git build-base bash sqlite  sqlite-libs  sqlite-dev procps openssh-client

USER raku

RUN zef install https://github.com/melezhik/Sparrow6.git --/test
RUN zef install https://github.com/melezhik/sparrowdo.git --test 
RUN zef install https://github.com/melezhik/sparky.git --/test

RUN git clone https://github.com/melezhik/sparky.git

COPY entrypoint.sh  /tmp/

ENTRYPOINT bash /tmp/entrypoint.sh

EXPOSE 3000
