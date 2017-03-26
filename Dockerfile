FROM python:3.5

MAINTAINER dimkk@outlook.com

RUN pip install --user azure-cli && \
    echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    apt-get update && \
    apt-get install -y cron mongodb-org-shell mongodb-org-tools && \
    echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections && \
    mkdir /backup

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENV CRON_TIME="0 0 * * *" \
    PATH=/root/.local/bin:$PATH


VOLUME ["/backup"]
CMD ["/bin/bash","/run.sh"]