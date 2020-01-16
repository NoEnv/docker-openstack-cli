FROM python:alpine as builder
MAINTAINER zyclonite

RUN apk add --update --no-cache git build-base linux-headers libffi-dev openssl-dev
RUN pip install --no-cache-dir --root=/app python-openstackclient python-heatclient python-octaviaclient

FROM python:alpine as latest
COPY --from=builder /app /
