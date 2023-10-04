FROM alpine:latest
MAINTAINER Faisal <faisal.is@gmail.com>

# IMAPs port
EXPOSE 993
# IMAP port
EXPOSE 143
# POPs port
EXPOSE 995
# POP port
EXPOSE 110
# LMTP port
EXPOSE 24

VOLUME /var/mail
VOLUME /etc/ssl/localcerts
VOLUME /etc/dovecot

# Install dovecot
RUN apk --update --no-cache add \
	dovecot \
	dovecot-lmtpd \
	dovecot-ldap \
	bash

# Add default conf
ADD default_conf /etc/dovecot

# Setup startup script
ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
