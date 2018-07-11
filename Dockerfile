FROM golang:1.10-alpine as ecs
RUN apk add --update --no-cache git build-base
RUN go get github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN wget https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    install -m755 ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli

FROM docker:latest

FROM python:3.7-alpine3.7
COPY --from=docker /usr/local/bin/docker /usr/local/bin/
COPY --from=ecs /go/bin/docker-credential-ecr-login /usr/local/bin/ecs-cli /usr/local/bin/
RUN pip install --no-cache-dir --progress-bar=off awscli docker-compose
