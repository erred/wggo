FROM golang:alpine AS build

RUN apk add make git && \
    git clone https://git.zx2c4.com/wireguard-go /wireguard-go
WORKDIR /wireguard-go
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 make

FROM alpine

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache bash wireguard-tools
COPY --from=build /wireguard-go/wireguard-go /usr/bin/wireguard-go
COPY run.sh .

ENV WG_I_PREFER_BUGGY_USERSPACE_TO_POLISHED_KMOD=1 
ENTRYPOINT ["/run.sh"]
