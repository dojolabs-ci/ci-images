FROM dojolabs/dojo-os

RUN apt -y update
RUN apt -y install \
	git \
	dh-make \
	build-essential \
        net-tools \
        iproute2 \
        libpcap-dev \
        libpcre3-dev \
        libdumbnet-dev \
        bison \
        flex \
        zlib1g-dev \
        liblzma-dev \
        openssl \
        libssl-dev \
        libnghttp2-dev \
        wget \
        git \
        libnetfilter-queue-dev \
        libnetfilter-conntrack-dev \
        file \
        vim \
        cmake \
        libhwloc-dev \
        automake \
        luajit-5.1-dev
	python-pip

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --progress-bar=off awscli
