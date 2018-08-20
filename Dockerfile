FROM adarnimrod/ci-images:python3.7
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        shellcheck \
    && \
    pip install --progress-bar=off -U --no-cache-dir pre_commit && \
    rm -rf /root/.cache /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/*
