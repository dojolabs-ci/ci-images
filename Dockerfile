FROM golang:1.10-alpine as ecs
RUN apk add --update --no-cache git build-base curl
RUN go get github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN wget https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    install -m755 ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli
RUN wget https://storage.googleapis.com/kubernetes-release/release/$(wget -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    install -m755 kubectl /usr/local/bin/

FROM gcr.io/heptio-images/authenticator:v0.3.0-alpine-3.7 as authenticator
FROM docker:latest as docker

FROM python:3.7-alpine3.7
COPY --from=docker /usr/local/bin/docker /usr/local/bin/
COPY --from=ecs /go/bin/docker-credential-ecr-login /usr/local/bin/ecs-cli /usr/local/bin/kubectl /usr/local/bin/
COPY --from=authenticator /heptio-authenticator-aws /usr/local/bin/
RUN apk add --update --no-cache git zip curl gettext bash-completion bash jq gcc musl-dev libffi-dev openssl-dev make
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --progress-bar=off awscli docker-compose pytest && \
    { docker version || true; } && \
    docker-credential-ecr-login version && \
    ecs-cli --version && \
    kubectl version --client && \
    aws --version && \
    docker-compose --version
    
# Setup template engine.
RUN curl -fsSL https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz | \
    tar -xz -C /usr/local/bin/
