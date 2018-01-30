FROM python:alpine
LABEL maintainer='Michael Benford <michael@michaelbenford.net>'

ARG USER=test
ARG PASSWD=test
ARG PUBLIC_HOST=127.0.0.1
ARG PORT=21

ENV USER ${USER}
ENV PASSWD ${PASSWD}
ENV PUBLIC_HOST ${PUBLIC_HOST}
ENV PORT ${PORT}

RUN mkdir -p /ftp/$USER
WORKDIR /ftp/$USER
RUN pip install pyftpdlib
EXPOSE $PORT 30000-30009
ENTRYPOINT python -m pyftpdlib --port=$PORT --nat-address=$PUBLIC_HOST --range=30000-30009 --username=$USER --password=$PASSWD --write --directory=/ftp/$USER
