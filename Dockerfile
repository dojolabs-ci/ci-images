FROM mesosphere/aws-cli as aws-cli
FROM dojolabs/dojo-os

COPY --from=aws-cli /usr/bin/aws /usr/bin/aws

RUN apt -y update
RUN apt -y install \
	git \
	dh-make
