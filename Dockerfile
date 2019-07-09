FROM dojolabs/dojo-os

RUN apt -y update
RUN apt -y install \
	git \
	dh-make \
	python-pip

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --progress-bar=off awscli
