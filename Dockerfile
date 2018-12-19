FROM debian:9.5
MAINTAINER Jens Erat <email@jenserat.de>

# Remove SUID programs
RUN for i in `find / -perm +6000 -type f 2>/dev/null`; do chmod a-s $i; done

RUN echo "deb http://http.debian.net/debian stretch main" >> /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y  tinc && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc

ENTRYPOINT [ "/usr/sbin/tincd" ]
CMD [ "start", "-D", "-U", "nobody" ]
