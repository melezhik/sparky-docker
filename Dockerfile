FROM alpine

ENV alpine_rakudo_apk_url=https://github.com/nxadm/rakudo-pkg/releases/download/v2012.12-02/rakudo-pkg-Alpine3.10_2020.12-02_x86_64.apk

ENV PATH=/opt/rakudo-pkg/share/perl6/site/bin:/opt/rakudo-pkg/bin:/root/.raku/bin:$PATH

RUN apk update --wait 120 && \ 
    apk add --wait 120 curl perl bash git && \
    curl -s -L -k -o /tmp/rakudo-pkg.apk \
    $alpine_rakudo_apk_url  && \
    apk add --allow-untrusted /tmp/rakudo-pkg.apk

RUN apk add sqlite  sqlite-libs  sqlite-dev procps openssh-client

RUN mkdir -p /root/.sparky/

ENV BAILADOR=host:0.0.0.0,port:3000

RUN zef install https://github.com/melezhik/Sparrow6.git --test

RUN zef install https://github.com/melezhik/sparrowdo.git --test

RUN zef install https://github.com/melezhik/sparky.git --/test

RUN git clone https://github.com/melezhik/sparky.git /root/sparky

COPY entrypoint.sh  /tmp/

#RUN echo "PATH=$PATH" >> $ENV

ENTRYPOINT bash /tmp/entrypoint.sh

EXPOSE 3000
