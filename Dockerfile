FROM docker:latest as docker
FROM dojolabs/dojo-os

COPY --from=docker /usr/local/bin/docker /usr/local/bin/
RUN apt -y update
RUN apt -y install \
	make \
	git \
	wget
