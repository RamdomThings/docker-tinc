FROM alpine:3.7
MAINTAINER Millaguie <spam@millaguie.net>

RUN apk add --no-cache ca-certificates \
                       less \
                       man \
                       tinc-pre \
                       tinc-pre-doc \
                       bash

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc

ENTRYPOINT [ "/usr/sbin/tincd" ]
CMD [ "-D", "-U", "nobody" ]
