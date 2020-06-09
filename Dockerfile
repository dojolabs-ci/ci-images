FROM widerin/eks-helmsman

ENV HELMFILE_VERSION 0.118.0
ENV HELM_VERSION 3.2.1
ENV AWS_CLI 1.16.8
ENV KUBECTL_VERSION 1.18.0

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
    
# Download AWS authenticator 
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mv aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
    
# Donwload kubectl    
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl    

# Download terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -o /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform
