FROM python:2.7-slim-stretch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        git \
        libffi-dev \
        libpq-dev \
        libssl-dev \
        zlib1g-dev \
    && \
    pip install --no-cache-dir --update pip tox pipenv | cat && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/* /root/.cache/*
