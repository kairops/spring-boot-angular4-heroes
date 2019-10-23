FROM kairops/duing

RUN apt-get update && \
    apt-get install -y ssh inetutils-ping

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
