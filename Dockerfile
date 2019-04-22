FROM widerin/eks-helmsman
USER root
RUN apk update && apk add git
