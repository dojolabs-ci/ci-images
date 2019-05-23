FROM docker:latest as docker
FROM dojolabs/dojo-os

COPY --from=docker /usr/local/bin/docker /usr/local/bin/

RUN apt -y update
RUN apt -y install \
	make \
	git \
	libfl-dev \
	libmpfr-dev \
	wget

RUN ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so /usr/lib/x86_64-linux-gnu/libmpfr.so.4
