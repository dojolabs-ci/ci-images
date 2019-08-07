FROM widerin/eks-helmsman

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.2.1
ENV HELMFILE_VERSION 0.80.2
ENV HELM_VERSION 2.14.3

USER root

RUN apk update && \
    apk add openssl git curl jq openjdk8-jre-base docker 

# HELMFILE
RUN wget -q https://github.com/roboll/helmfile/releases/download/v$HELMFILE_VERSION/helmfile_linux_amd64 && \
    mv helmfile_linux_amd64 /usr/local/bin/helmfile && \
    chmod a+x /usr/local/bin/helmfile

# HELM
RUN wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

# Download Kafka
RUN wget -q http://apache.mivzakim.net/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
    tar -xf kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -C /etc && \
    mv /etc/kafka_$SCALA_VERSION-$KAFKA_VERSION /etc/kafka
    
