FROM jjmerelo/alpine-perl6
ENV PATH=/root/.rakudobrew/bin:/root/.rakudobrew/moar-master/install/share/perl6/site/bin:$PATH
ENV USER=sparky
RUN curl -s -k https://raw.githubusercontent.com/melezhik/sparrowdo/master/resources/bootstrap.sh | sh \
&& apk add git build-base sqlite  sqlite-libs  sqlite-dev procps py2-pip openssh-client \
&& zef install https://github.com/melezhik/sparrowdo.git --/test \
&& zef install https://github.com/melezhik/sparky.git --/test \
&& git clone https://github.com/melezhik/sparky.git
COPY entrypoint.sh  /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]
EXPOSE 3000
