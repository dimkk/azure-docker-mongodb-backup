FROM azuresdk/azure-cli-python:latest

MAINTAINER dimkk@outlook.com
ADD run.sh /run.sh
RUN apk --update add mongodb mongodb-tools  && \
    mkdir /backup && \
    chmod +x /run.sh
    

ENV CRON_TIME="0 0 * * *"


VOLUME ["/backup"]
CMD ["/run.sh"]