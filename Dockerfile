FROM node:12.10.0-stretch
RUN apt-get update && \
    apt-get install -y maven openjdk-8-jdk mysql-client net-tools && \
    apt-get -y autoclean && apt-get -y autoremove && \
    apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
    rm -rf /var/lib/apt/lists/*
RUN yes n | npm install -g @angular/cli
COPY entrypoint.sh /entrypoint.sh
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/bin/wait-for-it.sh
RUN chmod +x /usr/bin/wait-for-it.sh
COPY . /workspace
WORKDIR /workspace

