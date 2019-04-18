FROM alpine:3.7
MAINTAINER Millaguie <spam@millaguie.net>

RUN apk add --no-cache ca-certificates \
                       less \
                       man \
                       tinc-pre \
                       tinc-pre-doc \
                       bash \
                       git

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc
ADD entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
