# build stage
FROM golang:1.22 AS builder_go

WORKDIR /opt/app
COPY main.go go.mod go.sum ./
RUN go build -o /opt/bin/main .

# final stage
FROM debian:12-slim

RUN apt-get update \
    && apt-get --no-install-recommends -y install \
    	ca-certificates \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder_go  /opt/bin/main /opt/bin/main

CMD ["/opt/bin/main"]