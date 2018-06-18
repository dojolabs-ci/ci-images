FROM docker:latest
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories && \
    apk add --update --no-cache python3 && \
    pip3 install --no-cache-dir --upgrade awscli docker-compose pip | cat && \
    wget https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    install -m755 ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli && \
    rm ecs-cli-linux-amd64-latest
