FROM docker:latest
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories && \
    apk add --update --no-cache python3 && \
    pip3 install --no-cache-dir --upgrade awscli docker-compose pip | cat
