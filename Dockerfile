FROM golang:alpine AS build
ENV GO111MODULE=on

RUN go get golang.zx2c4.com/wireguard@v0.0.20200320


FROM alpine
ENV WG_I_PREFER_BUGGY_USERSPACE_TO_POLISHED_KMOD=1

RUN apk add --no-cache bash wireguard-tools

COPY run.sh .
COPY --from=build /go/bin/wireguard /usr/bin/wireguard-go

ENTRYPOINT ["/run.sh"]
