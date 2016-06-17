FROM base/archlinux

MAINTAINER Tiago Daniel Jacobs <tiago@imdt.com.br>

RUN pacman --noconfirm -Sy && \
    pacman --noconfirm -Sy archlinux-keyring && \
    pacman --noconfirm -S pacman  && \
    pacman-db-upgrade &&\
    pacman --noconfirm -Su && \
    pacman --noconfirm -S htop && \
    pacman --noconfirm -S spamassassin && \
    pacman --noconfirm -S razor

COPY spamd.sh /
COPY update.sh /
COPY run.sh /

EXPOSE 783

CMD ["/run.sh"]
