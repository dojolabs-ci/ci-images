FROM adarnimrod/goose as goose

FROM python:3.6-slim-stretch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        git \
        libffi-dev \
        libpq-dev \
        libssl-dev \
        zlib1g-dev \
    && \
    pip install --progress-bar=off --no-cache-dir --upgrade pip tox pipenv && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/* /root/.cache/*
COPY --from=goose /usr/local/bin/goose /usr/local/bin/goose
