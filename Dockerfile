FROM widerin/eks-helmsman

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.2.1
ENV HELMFILE_VERSION 0.80.2

USER root

RUN apk update && apk add git
##RUN apk update && \
#    apk add openssl git curl jq openjdk8-jre-base docker 
#
#RUN wget -q https://github.com/roboll/helmfile/releases/download/v$HELMFILE_VERSION/helmfile_linux_amd64 && \
#    mv helmfile_linux_amd64 /usr/local/bin/helmfile && \
#    chmod a+x /usr/local/bin/helmfile && \
#    curl --silent -L https://git.io/get_helm.sh | bash
#
#    # Download Kafka
#RUN wget -q http://apache.mivzakim.net/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz && \
#    tar -xf kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -C /etc && \
#    mv /etc/kafka_$SCALA_VERSION-$KAFKA_VERSION /etc/kafka
    
