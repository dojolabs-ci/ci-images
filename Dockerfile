FROM python:3.7-alpine
 
ENV HELMFILE_VERSION 0.118.0
ENV HELM_VERSION 3.2.1
ENV AWS_CLI 2.0.55
ENV KUBECTL_VERSION 1.18.0
ENV ISTIO_VERSION 1.7.3
 
USER root

RUN apk update
RUN apk add --update coreutils
RUN apk add gawk openssl git curl jq openjdk8-jre-base docker sed bash
 
# ISTIO
RUN curl -o istio.tar.gz https://storage.googleapis.com/istio-release/releases/${ISTIO_VERSION}/istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz && \
 tar -xvzf istio.tar.gz && \
 mv istioctl /usr/local/bin/istioctl && \
 chmod a+x /usr/local/bin/istioctl && \
 rm -rf istio.tar.gz
 
# AWS CLI
RUN apk add aws-cli
 
# HELMFILE
RUN wget -q https://github.com/roboll/helmfile/releases/download/v$HELMFILE_VERSION/helmfile_linux_amd64 && \
 mv helmfile_linux_amd64 /usr/local/bin/helmfile && \
 chmod a+x /usr/local/bin/helmfile
 
# HELM
RUN wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
 tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
 mv linux-amd64/helm /usr/local/bin/helm && \
 rm -rf helm-*.tar.gz linux-amd64
 
# Download AWS authenticator
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
 chmod +x ./aws-iam-authenticator && \
 mv aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
 
# Donwload kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
 chmod +x /usr/local/bin/kubectl
 
# Download terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip -o terraform.zip && \
 unzip terraform.zip && \
 mv terraform /usr/local/bin/ && \
 chmod +x /usr/local/bin/terraform && \
 rm -rf terraform.zip
 
# Add HelmDiff to support helmsman
RUN helm plugin install https://github.com/databus23/helm-diff
 
# Add helmpush
RUN helm plugin install https://github.com/chartmuseum/helm-push.git
