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

COPY scripts/spamd.sh /
COPY scripts/update.sh /
COPY scripts/run.sh /

EXPOSE 783

CMD ["/run.sh"]
