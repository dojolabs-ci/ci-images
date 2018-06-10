FROM python:3.6-slim-stretch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        git \
        shellcheck \
    && \
    pip install --progress-bar=off -U --no-cache-dir pre_commit pip && \
    rm -rf /root/.cache /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/*
