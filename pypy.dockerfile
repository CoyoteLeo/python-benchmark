FROM pypy:3.10-slim-bookworm AS base

LABEL maintainer="karta09104@gmail.com"
LABEL org.opencontainers.image.source="https://github.com/CoyoteLeo/python-benchmark"

# pip config
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /opt/app/
RUN apt-get update && apt-get install -y --no-install-recommends libuv1 zlib1g
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl \
    && pip install fastapi[standard] uvicorn gunicorn socketify --no-binary :all \
    && apt-get --purge autoremove -y build-essential curl \
    && apt-get autoclean

COPY main.py .