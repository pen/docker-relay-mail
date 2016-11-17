FROM alpine

MAINTAINER Abe Masahiro <pen@thcomp.org>

RUN apk add --no-cache postfix

COPY rootfs /

CMD ["/etc/rc.entry"]
