FROM ubuntu:trusty
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apt-get update && \
    apt-get install -y build-essential golang git mercurial && \
    mkdir -p /release

ENV NGROK_VERSION 1.7.1
RUN git clone https://github.com/inconshreveable/ngrok.git /ngrok
RUN cd /ngrok; git checkout -fq $NGROK_VERSION

####################################
RUN mkdir -p /ngrok/src/code.google.com/p
RUN mkdir -p /ngrok/src/gopkg.in
RUN git clone https://github.com/qida/log4go.git
RUN mv -f log4go /ngrok/src/code.google.com/p/
RUN git clone https://github.com/qida/yaml.git
RUN mv -f yaml /ngrok/src/gopkg.in/yaml.v1
####################################
ADD *.sh /

ENV TLS_KEY **None**
ENV TLS_CERT **None**
ENV CA_CERT **None**
ENV DOMAIN **None**
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443

VOLUME ["/ngrok/bin"]

CMD ["/run-server.sh"]
